//
//  TimeLapRecord.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 8. 5..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import CoreData

class TimeLapRecord: NSManagedObject {

    @NSManaged var laptime: NSData
    @NSManaged var roundname: NSDate

}
