//
//  ViewController.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 25..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet var stateLabel: UILabel?
    @IBOutlet var timeLabel: UILabel?
    @IBOutlet var startBtn: UIButton?
    @IBOutlet var resetBtn: UIButton?
    
    var timerDelegate: TimerProtocol?
    var stopWatchTimer: NSTimer?
    
    var exRunningTime: NSTimeInterval = 0.0
    var runningTime: NSTimeInterval = 0.0
    var stoppedTime: NSTimeInterval = 0.0
    
    var startDate: NSDate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopWatchTimer = NSTimer(timeInterval: 0.01,
            target: self,
            selector: "checkTicTime",
            userInfo: nil,
            repeats: true)
        
        timeLabel!.text = "00.00"
        timerDelegate = TimerReset(timerController: self)
        
        startBtn!.titleLabel.text = "Start"
        resetBtn!.titleLabel.text = "Reset"
        resetBtn!.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpStartBtn() {
        timerDelegate!.touchUpStartBtn()
    }
    
    @IBAction func touchUpResetBtn() {
        timerDelegate!.touchUpResetBtn()
    }
    
    func checkTicTime() {
        
        if !startDate {
            startDate = NSDate()
        }
        
        runningTime = NSDate().timeIntervalSinceDate(startDate)
        runningTime += exRunningTime
        timeLabel!.text = String().stringByAppendingFormat("%0.2lf", runningTime-stoppedTime)
        
    }
    
    func checkStopTime() {
        exRunningTime = runningTime
        startDate = nil
        
        stopWatchTimer = NSTimer(timeInterval: 0.01,
            target: self,
            selector: "checkTicTime",
            userInfo: nil,
            repeats: true)
    }
}

