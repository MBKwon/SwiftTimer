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
    
    var persistentStoreCoordinator: NSPersistentStoreCoordinator {
    
    }
    
    var managedObjectContext: NSManagedObjectContext {
    if managedObjectContext == nil {
        let coordinator = self.store.persistentStoreCoordinator
        if coordinator != nil {
            managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
            managedObjectContext!.persistentStoreCoordinator = coordinator
        }
        }
        return_managedObjectContext!
    }
}
