//
//  CoreDataAssistant.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 7. 29..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import CoreData

class CoreDataAssistant: NSObject {
    
    var store: CoreDataStore = CoreDataStore()
    
    var managedObjectContext: NSManagedObjectContext {
    
    var objectContext: NSManagedObjectContext
        
        if self.managedObjectContext == nil {
            let coordinator = self.store.persistentStoreCoordinator
            if coordinator != nil {
                objectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
                objectContext.persistentStoreCoordinator = coordinator
                
                return objectContext
            }
        }
        
        return self.managedObjectContext
    }
}
