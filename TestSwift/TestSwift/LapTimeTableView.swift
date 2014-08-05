//
//  LapTimeTableView.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 8. 4..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import UIKit

class LapTimeTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    weak var timerController: TimerViewController?
    
    var lapTimeList: NSArray? = nil
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        if timerController?.coreDataHelper.isExistAnyRecord() == true {
            var lapTimes: TimeLapRecord = timerController!.coreDataHelper.fetchLatestRound()
            
            if lapTimes != nil {
                lapTimeList = lapTimes.getLapTimeList()
                if lapTimeList != nil {
                    return lapTimeList!.count;
                    
                }
            }
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "lapTimeTableViewCell")
        
        if lapTimeList?.count > indexPath.row {
            var dataModel: TimeLapRecord = lapTimeList?[indexPath.row] as TimeLapRecord
            var currentCalendar: NSCalendar = NSCalendar.currentCalendar()
            var currentDate: NSDate = NSDate(timeIntervalSince1970: dataModel.roundtimestamp)
            
            var dateComponents: NSDateComponents = currentCalendar.components(
                NSCalendarUnit.CalendarUnitYear |
                    NSCalendarUnit.CalendarUnitMonth |
                    NSCalendarUnit.CalendarUnitDay |
                    NSCalendarUnit.CalendarUnitHour |
                    NSCalendarUnit.CalendarUnitMinute |
                    NSCalendarUnit.CalendarUnitSecond,
                fromDate: currentDate)
            
            var dateString: String = String().stringByAppendingFormat("%d년 %d월 %d일 %d시 %d분 %d초",
                dateComponents.year,
                dateComponents.month,
                dateComponents.day,
                dateComponents.hour,
                dateComponents.minute,
                dateComponents.second)
            
            cell.textLabel.text = dateString
            cell.detailTextLabel.text = String().stringByAppendingFormat("주자 : %d명", dataModel.getLapTimeList().count)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)
        cell.selected = false
    }
}
