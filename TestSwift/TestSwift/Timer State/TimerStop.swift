//
//  TimerStop.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 28..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import UIKit

class TimerStop : NSObject, TimerProtocol {
    
    weak var timerController: TimerViewController?
    
    init(timerController: TimerViewController!) {
        if (timerController != nil) {
            self.timerController = timerController
            self.timerController!.stateLabel!.text = "Stop State"
            
            self.timerController!.startBtn!.setTitle("Restart", forState: UIControlState.Normal)
            self.timerController!.resetBtn!.setTitle("Reset", forState: UIControlState.Normal)
        }
    }
    
    func touchUpStartBtn() {
        if let stopTimer = timerController?.stopWatchTimer {
            NSRunLoop.mainRunLoop().addTimer(stopTimer, forMode: NSDefaultRunLoopMode)
            self.timerController!.timerDelegate = TimerRunning(timerController: self.timerController);
        }
    }
    
    func touchUpResetBtn() {
        self.timerController?.currentLapTimeRecord = nil
        self.timerController?.exRunningTime = 0.0
        self.timerController!.timerDelegate = TimerReset(timerController: self.timerController);
    }
}
