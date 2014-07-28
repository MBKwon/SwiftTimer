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
    
    weak var timerContoller:TimerViewController?
    
    init(timerContoller: TimerViewController!) {
        if timerContoller {
            self.timerContoller = timerContoller
            
            self.timerContoller!.startBtn!.titleLabel.text = "Stop"
            self.timerContoller!.startBtn!.titleLabel.text = "Lap"
        }
    }
    
    func touchUpStartBtn() {
        self.timerContoller!.timerDelegate = TimerStop(timerContoller: self.timerContoller);
    }
    
    func touchUpResetBtn() {
        
    }
}
