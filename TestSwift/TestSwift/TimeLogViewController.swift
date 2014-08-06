//
//  TimeLogViewController.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 8. 5..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import UIKit

class TimeLogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var timerController: TimerViewController?
    
    var roundList: NSArray? = nil
    
    @IBAction func touchUpBackBtn() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        roundList = timerController?.coreDataHelper.fetchAllRound()
        
        if roundList != nil {
            return roundList!.count;
            
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "lapTimeTableViewCell")
        
        if roundList?.count > indexPath.row {
            var dataModel: TimeLapRecord = roundList?[indexPath.row] as TimeLapRecord
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
        
        performSegueWithIdentifier("showDetailLog", sender: nil)
    }
}
