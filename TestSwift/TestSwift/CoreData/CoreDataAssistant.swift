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
    
    var backgroundContext: NSManagedObjectContext {
    
    var objectContext: NSManagedObjectContext
        
        if self.backgroundContext == nil {
            let coordinator = self.store.persistentStoreCoordinator
            if coordinator != nil {
                objectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
                objectContext.persistentStoreCoordinator = coordinator
                
                return objectContext
            }
        }
        
        return self.backgroundContext
    }
    
    
    // save NSManagedObjectContext
    func saveContext (context: NSManagedObjectContext) {
        var error: NSError? = nil
        if context != nil {
            if context.hasChanges && !context.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. 
                // You should not use this function in a shipping application, although it may be useful during development.
                
                NSLog("Unresolved error \(error)")
                abort()
            }
        }
    }
    
    func saveContext () {
        self.saveContext(self.backgroundContext)
    }
}
