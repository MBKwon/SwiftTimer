//
//  TimerReset.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 28..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import UIKit

class TimerReset : NSObject, TimerProtocol {
    
    weak var timerController:TimerViewController?
    
    init(timerController: TimerViewController!) {
        if timerController {
            self.timerController = timerController
            self.timerController!.stateLabel!.text = "Reset State"
            self.timerController!.runningTime = 0.0
            self.timerController!.stoppedTime = 0.0
            
            self.timerController!.startBtn!.setTitle("Start", forState: UIControlState.Normal)
            self.timerController!.resetBtn!.setTitle("Reset", forState: UIControlState.Normal)
            self.timerController!.resetBtn!.enabled = false
        }
    }
    
    func touchUpStartBtn() {
        NSRunLoop.mainRunLoop().addTimer(timerController?.stopWatchTimer, forMode: NSDefaultRunLoopMode)
        self.timerController!.timerDelegate = TimerRunning(timerController: self.timerController);
    }
    
    func touchUpResetBtn() {
        // do not anything.
    }
}
