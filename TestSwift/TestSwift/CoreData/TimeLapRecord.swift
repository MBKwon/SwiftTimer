//
//  TimeLapRecord.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 29..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import CoreData

class TimeLapRecord: NSManagedObject {

    @NSManaged var roundname: String
    @NSManaged var laptime: NSData

}
