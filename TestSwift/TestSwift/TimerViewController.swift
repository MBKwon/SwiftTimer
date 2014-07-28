//
//  ViewController.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 25..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet var timeLabel:UILabel?
    @IBOutlet var startBtn:UIButton?
    @IBOutlet var resetBtn:UIButton?
    
    var timerDelegate:TimerProtocol?
    
    var runningTime:NSTimeInterval = 0.0
    var stoppedTime:NSTimeInterval = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.timeLabel!.text = "00:00.00"
        self.timerDelegate = TimerReset(timerController: self)
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
}
