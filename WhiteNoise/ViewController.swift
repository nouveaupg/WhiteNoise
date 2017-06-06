//
//  ViewController.swift
//  WhiteNoise
//
//  Created by John Hill on 4/14/17.
//  Copyright © 2017 John Hill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var paused:Bool = true
    
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
        if paused {
            playButton?.setTitle("Play", for: .normal)
            paused = false
        }
        else {
            playButton?.setTitle("Pause", for: .normal)
            paused = true
        }
    }
}

