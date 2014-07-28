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
    
    weak var timerContoller:UIViewController?
    
    init(timerContoller: UIViewController!) {
        if timerContoller {
            self.timerContoller = timerContoller
        }
    }
    
    func touchUpStartBtn() {
        
    }
    
    func touchUpStopBtn() {
        
    }
}
