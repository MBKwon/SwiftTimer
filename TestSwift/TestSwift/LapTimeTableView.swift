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
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "lapTimeTableViewCell")
    }
}
