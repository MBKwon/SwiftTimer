//
//  TimeLapRecord_Extension.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 29..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation

extension TimeLapRecord {
    
    func setNewRecordRound(roundName: NSDate) {
        self.roundname = roundName
    }
    
    func addNewLapTime(newLapTime: NSString) {
        
        var lapTimeRecords:NSMutableArray;
        if laptime != nil {
            lapTimeRecords = NSKeyedUnarchiver.unarchiveObjectWithData(laptime) as NSMutableArray
            
        } else {
            lapTimeRecords = NSMutableArray()
        }
        
        lapTimeRecords.addObject(newLapTime)
        
        laptime = NSKeyedArchiver.archivedDataWithRootObject(lapTimeRecords)
    }
    
    func getLapTimeList() -> NSArray {
        
        var lapTimeRecords:NSMutableArray;
        if laptime != nil {
            return NSKeyedUnarchiver.unarchiveObjectWithData(laptime) as NSArray
            
        } else {
            return NSArray()
        }
    }
}
