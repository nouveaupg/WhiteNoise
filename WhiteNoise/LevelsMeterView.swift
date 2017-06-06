//
//  LevelsMeterView.swift
//  WhiteNoise
//
//  Created by John Hill on 5/27/17.
//  Copyright © 2017 John Hill. All rights reserved.
//

import UIKit

enum RNGs {
    case arc4,random,urandom
    func simpleDescription() -> String {
    switch self {
        case .arc4:
            return "arc4"
        case .random:
            return "random"
        case .urandom:
            return "urandom"
        }
    }
}


class LevelsMeterView: UIView {
    
    let lineLevelWidth = 5
    var levels = [Float32]()
    var currentRNG:RNGs = .arc4
    
    @objc required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // everytime we start with arc4random to initialize...
        let viewWidth:Int = Int(self.frame.width)
        let graphLines = viewWidth / lineLevelWidth
        let divisor:Float32 = exp2(32)
        for _ in 0...graphLines {
            let level:Float32 = ((Float32(arc4random()) / divisor) - Float32(0.5)) * Float32(2)
            levels.append(level)
        }
    }
    
    @IBAction func setRNG(sender:UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentRNG = .arc4
        case 1:
            currentRNG = .random
        case 2:
            currentRNG = .urandom
        default:
            currentRNG = .arc4
        }
    }
    
    func next() {
        var level:Float32 = 0
        switch currentRNG {
        case .arc4:
            level = ((Float32(arc4random()) / exp2(32)) - Float32(0.5)) * Float32(2)
        default:
            level = ((Float32(arc4random()) / exp2(32)) - Float32(0.5)) * Float32(2)
        }
        levels.insert(level, at: 0)
        levels.removeLast()
        self.setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        
        UIColor.blue.set()
        for index in 0...(levels.count-1) {
            let currentLevel = levels[index] * Float32(rect.height) / 2
            let x = CGFloat((lineLevelWidth * index)+3)
            let y = (CGFloat(Float32(rect.height / 2) * levels[index]))
            if currentLevel > 0 {
                let levelPath = UIBezierPath(roundedRect: CGRect(x:x,
                                                             y:(rect.height/2-y),
                                                             width:CGFloat(lineLevelWidth),
                                                             height:y),
                                         cornerRadius: CGFloat(3))
                levelPath.fill()
            }
            else {
                let levelPath = UIBezierPath(roundedRect: CGRect(x:x,
                                                                 y:(rect.height/2),
                                                                 width:CGFloat(lineLevelWidth),
                                                                 height:abs(y)),
                                             cornerRadius: CGFloat(3))
                levelPath.fill()
            }
        
        }
    }
}
