//
//  TimerRunning.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 28..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import UIKit

class TimerRunning : NSObject, TimerProtocol {
    
    weak var timerController:TimerViewController?
    
    init(timerController: TimerViewController!) {
        if timerController {
            self.timerController = timerController
            self.timerController!.stateLabel!.text = "Running State"
            
            self.timerController!.startBtn!.setTitle("Stop", forState: UIControlState.Normal)
            self.timerController!.resetBtn!.setTitle("Lap", forState: UIControlState.Normal)
            self.timerController!.resetBtn!.enabled = true
        }
    }
    
    func touchUpStartBtn() {
        timerController?.stopWatchTimer?.invalidate()
        timerController?.checkStopTime()
        self.timerController!.timerDelegate = TimerStop(timerController: self.timerController);
    }
    
    func touchUpResetBtn() {
        // record lap time
    }
}
