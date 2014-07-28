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
            
            self.timerController!.startBtn!.titleLabel.text = "Stop"
            self.timerController!.resetBtn!.titleLabel.text = "Lap"
            self.timerController!.resetBtn!.enabled = true
        }
    }
    
    func touchUpStartBtn() {
        self.timerController!.timerDelegate = TimerStop(timerController: self.timerController);
    }
    
    func touchUpResetBtn() {
        
    }
}
