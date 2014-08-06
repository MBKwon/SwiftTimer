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
            var lapTimes: TestSwift.TimeLapRecord = timerController!.coreDataHelper.fetchLatestRound()
            
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
            var timeString: String = lapTimeList?[indexPath.row] as NSString
            
            cell.textLabel.text = String().stringByAppendingFormat("주자 %d", indexPath.row+1)
            cell.detailTextLabel.text = String().stringByAppendingFormat("시간 : %@", timeString)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)
        cell.selected = false
    }
}
