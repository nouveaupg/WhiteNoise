//
//  ViewController.swift
//  WhiteNoise
//
//  Created by John Hill on 4/14/17.
//  Copyright © 2017 John Hill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // lol argument against using enum
    var playing:Int = 0
    var soundTimer:Timer? = nil
    
    @IBOutlet weak var playButton:UIButton?
    @IBOutlet weak var levelsMeter:LevelsMeterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        levelsMeter?.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressPlay(sender:UIButton) {
        if playing <= 1 {
            playButton?.setTitle("Pause", for: .normal)
            playing = 2
            soundTimer = Timer.scheduledTimer(timeInterval: 0.05, target: levelsMeter!, selector: Selector(("next")), userInfo: nil, repeats: true)
        }
        else {
            playButton?.setTitle("Play", for: .normal)
            playing = 1
            if soundTimer != nil {
                soundTimer?.invalidate()
            }
        }
    }
}

