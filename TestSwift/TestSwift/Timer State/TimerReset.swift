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
    
    weak var timerContoller:TimerViewController?
    
    init(timerContoller: TimerViewController!) {
        if timerContoller {
            self.timerContoller = timerContoller
            self.timerContoller!.runningTime = 0.0
            self.timerContoller!.stoppedTime = 0.0
            
            self.timerContoller!.startBtn!.titleLabel.text = "Start"
            self.timerContoller!.startBtn!.titleLabel.text = "Reset"
        }
    }
    
    func touchUpStartBtn() {
        
    }
    
    func touchUpStopBtn() {
        
    }
}
