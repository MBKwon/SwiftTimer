//
//  ViewController.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 25..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var logBtn: UIButton!
    
    @IBOutlet weak var lapTimeTableView: LapTimeTableView!
    
    var _coreStore: CoreDataStore? = nil
    var coreStore: CoreDataStore {
        if _coreStore == nil {
            _coreStore = CoreDataStore()
            
            return _coreStore!
        }
        return _coreStore!
    }
    
    var _coreDataHelper: CoreDataAssistant? = nil
    var coreDataHelper: CoreDataAssistant {
        if _coreDataHelper == nil {
            _coreDataHelper = CoreDataAssistant()
            return _coreDataHelper!
        }
        return _coreDataHelper!
    }
    
    var currentLapTimeRecord: TimeLapRecord? = nil
    
    
    var timerDelegate: TimerProtocol?
    var stopWatchTimer: NSTimer?
//    {
//    
//    return NSTimer(timeInterval: 0.01,
//        target: self,
//        selector: "checkTicTime",
//        userInfo: nil,
//        repeats: true)
//    }
    
    var exRunningTime: NSTimeInterval = 0.0
    var runningTime: NSTimeInterval = 0.0
    var stoppedTime: NSTimeInterval = 0.0
    
    var displayTime: NSTimeInterval = 0.0
    
    var startDate: NSDate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lapTimeTableView!.dataSource = lapTimeTableView
        lapTimeTableView!.delegate = lapTimeTableView
        
        NSNotificationCenter.defaultCenter().addObserver(lapTimeTableView, selector: "reloadData", name: RELOAD_LAPTIME_TABLEVIEW, object: nil)
        
        timeLabel!.text = "00.00"
        timerDelegate = TimerReset(timerController: self)
        
        initStopWatchTimer()
        
        startBtn!.titleLabel.text = "Start"
        resetBtn!.titleLabel.text = "Reset"
        resetBtn!.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        lapTimeTableView!.timerController = self
    }
    
    @IBAction func touchUpStartBtn() {
        timerDelegate!.touchUpStartBtn()
    }
    
    @IBAction func touchUpResetBtn() {
        timerDelegate!.touchUpResetBtn()
    }
    
    @IBAction func touchUpLogBtn() {
        performSegueWithIdentifier("showRunningLog", sender: "RunningLog")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if sender.isEqualToString("RunningLog") {
            var nextVC: TimeLogViewController = segue.destinationViewController as TimeLogViewController
            nextVC.timerController = self
        }
    }
    
    func checkTicTime() {
        
        if startDate == nil {
            startDate = NSDate()
        }
        
        runningTime = NSDate().timeIntervalSinceDate(startDate!)
        runningTime += exRunningTime
        displayTime = runningTime-stoppedTime
        timeLabel!.text = String().stringByAppendingFormat("%0.2lf", displayTime)
        
    }
    
    func checkStopTime() {
        exRunningTime = runningTime
        startDate = nil
        
        initStopWatchTimer()
    }
    
    func initStopWatchTimer() {
        
        stopWatchTimer = NSTimer(timeInterval: 0.01,
            target: self,
            selector: "checkTicTime",
            userInfo: nil,
            repeats: true)
    }
}

