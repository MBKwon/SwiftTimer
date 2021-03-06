//
//  TimeLapRecord_Extension.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 29..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation

extension TimeLapRecord {
    
    func setNewRecordRound(date: NSDate) {
        self.roundtimestamp = date.timeIntervalSince1970
    }
    
    func addNewLapTime(newLapTime: NSString) {
        
        var lapTimeRecords:NSMutableArray;
            lapTimeRecords = NSKeyedUnarchiver.unarchiveObjectWithData(laptime) as NSMutableArray
        
        lapTimeRecords.addObject(newLapTime)
        
        laptime = NSKeyedArchiver.archivedDataWithRootObject(lapTimeRecords)
    }
    
    func getLapTimeList() -> NSArray {
        
        var lapTimeRecords:NSMutableArray;
        return NSKeyedUnarchiver.unarchiveObjectWithData(laptime) as NSArray
    }
}
