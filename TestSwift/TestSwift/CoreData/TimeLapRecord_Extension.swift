//
//  TimeLapRecord_Extension.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 29..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation

extension TimeLapRecord {
    
    func setNewRecordRound(roundName: NSString) {
        self.roundname = roundName
    }
    
    
    func addNewLapTime(lapTime: NSString) {
        
        var lapTimeRecord:NSMutableArray = NSKeyedUnarchiver.unarchiveObjectWithData(laptime) as NSMutableArray
        
        if lapTimeRecord == nil {
            lapTimeRecord = NSMutableArray()
        }
        
        lapTimeRecord.addObject(lapTimeRecord)
        
        laptime = NSKeyedArchiver.archivedDataWithRootObject(lapTimeRecord)
    }
}
