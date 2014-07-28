//
//  ViewController.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 25..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet var stateLabel:UILabel?
    @IBOutlet var timeLabel:UILabel?
    @IBOutlet var startBtn:UIButton?
    @IBOutlet var resetBtn:UIButton?
    
    var timerDelegate:TimerProtocol?
    var stopWatchTimer:NSTimer?
    
    var runningTime:NSTimeInterval = 0.0
    var stoppedTime:NSTimeInterval = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopWatchTimer = NSTimer(timeInterval: 0.01,
            target: self,
            selector: "checkTicTime",
            userInfo: nil,
            repeats: true)
        
        self.timeLabel!.text = "00:00.00"
        self.timerDelegate = TimerReset(timerController: self)
        
        self.startBtn!.titleLabel.text = "Start"
        self.resetBtn!.titleLabel.text = "Reset"
        self.resetBtn!.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpStartBtn() {
        self.timerDelegate!.touchUpStartBtn()
    }
    
    @IBAction func touchUpResetBtn() {
        self.timerDelegate!.touchUpResetBtn()
    }
    
    func checkTicTime() {
        NSLog("tic time")
    }
}

