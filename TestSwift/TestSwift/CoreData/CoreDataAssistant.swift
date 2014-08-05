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
    
    
    var _managedObjectContext: NSManagedObjectContext? = nil
    var managedObjectContext: NSManagedObjectContext {
        if _managedObjectContext == nil {
            let coordinator = self.store.persistentStoreCoordinator
            if coordinator != nil {
                _managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
                _managedObjectContext?.persistentStoreCoordinator = coordinator
                
                return _managedObjectContext!
            }
            }
            
            return _managedObjectContext!
    }
    
    
    var _backgroundContext: NSManagedObjectContext? = nil
    var backgroundContext: NSManagedObjectContext {
        if _backgroundContext == nil {
            let coordinator = self.store.persistentStoreCoordinator
            if coordinator != nil {
                _backgroundContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
                _backgroundContext?.persistentStoreCoordinator = coordinator
                
                return _backgroundContext!
            }
            }
            
            return _backgroundContext!
    }
    
    
    func isExistAnyRecord() -> Bool {
        
        var fetchRequest: NSFetchRequest = NSFetchRequest(entityName: "TimeLapRecord")
        if fetchRequest != nil {
            fetchRequest.fetchLimit = 1
            
            var resultArray: NSArray = managedObjectContext.executeFetchRequest(fetchRequest, error: nil)
            if resultArray.count > 0 {
                return true
            }
        }
        
        return false
    }
    
    func fetchLatestRound() -> TimeLapRecord {
        
        var latestRecord: TimeLapRecord = TimeLapRecord()
        
        var fetchRequest: NSFetchRequest = NSFetchRequest(entityName: "TimeLapRecord")
        if fetchRequest != nil {
            var sortDescriptor: NSSortDescriptor = NSSortDescriptor(key: "roundtimestamp", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            var resultList: NSArray = managedObjectContext.executeFetchRequest(fetchRequest, error: nil)
            
            if resultList.count > 0 {
                latestRecord = resultList.lastObject as TimeLapRecord
                return latestRecord
            }
        }
        
        return latestRecord
    }
    
    func fetchAllRound() -> NSArray {
        
        var resultList: NSArray = NSArray()
        
        var fetchRequest: NSFetchRequest = NSFetchRequest(entityName: "TimeLapRecord")
        if fetchRequest != nil {
            var sortDescriptor: NSSortDescriptor = NSSortDescriptor(key: "roundtimestamp", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            resultList = managedObjectContext.executeFetchRequest(fetchRequest, error: nil)
            
            return resultList
        }
        
        return resultList
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
                
            } else if error == nil {
                NSNotificationCenter.defaultCenter().postNotificationName(RELOAD_LAPTIME_TABLEVIEW, object: nil)
            }
        }
    }
    
    func saveContext () {
        self.saveContext(self.backgroundContext)
    }
}
