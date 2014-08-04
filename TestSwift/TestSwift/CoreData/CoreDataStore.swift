//
//  CoreDataStore.swift
//  TestSwift
//
//  Created by MB KWON on 2014. 8. 4..
//  Copyright (c) 2014년 UANGEL Corp. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStore: NSObject {
    
    let storeName = "SwiftTimerTimeCoreData"
    let storeFileName = "SwiftTimerTimeCoreData.sqlite"
    
    init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSaveContext:", name: NSManagedObjectContextDidSaveNotification, object: nil)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func contextDidSaveContext(notification: NSNotification) {
    }
    
    var managedObjectModel: NSManagedObjectModel {
    var objectModel: NSManagedObjectModel
        
        if self.managedObjectModel == nil {
            let modelURL = NSBundle.mainBundle().URLForResource(storeName, withExtension: "momd")
            var objectModel: NSManagedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)
            
            return objectModel
            
        } else {
            return self.managedObjectModel
        }
    }
    
    var persistentStoreCoordinator: NSPersistentStoreCoordinator {
    var persistentCoordinator: NSPersistentStoreCoordinator
        if self.persistentStoreCoordinator == nil {
            
            let storeURL = self.applicationDocumentsDirectory.URLByAppendingPathComponent(storeFileName)
            var error: NSError? = nil
            persistentCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            if persistentCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil, error: &error) == nil {
                abort()
            }
            
            return persistentCoordinator
            
        } else {
            return self.persistentStoreCoordinator
        }
    }
    
    var applicationDocumentsDirectory: NSURL {
    let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.endIndex-1] as NSURL
    }
}
