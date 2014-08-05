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
    
    let storeName = "TestSwift"
    let storeFileName = "TestSwift.sqlite"
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSaveContext:", name: NSManagedObjectContextDidSaveNotification, object: nil)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func contextDidSaveContext(notification: NSNotification) {
    }
    
    var _managedObjectModel: NSManagedObjectModel? = nil
    var managedObjectModel: NSManagedObjectModel {
        if _managedObjectModel == nil {
            let modelURL = NSBundle.mainBundle().URLForResource(storeName, withExtension: "momd")
            _managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)
            
            return _managedObjectModel!
            
        } else {
            return _managedObjectModel!
        }
    }
    
    
    var _persistentCoordinator: NSPersistentStoreCoordinator? = nil
    var persistentStoreCoordinator: NSPersistentStoreCoordinator {
        if _persistentCoordinator == nil {
            
            let storeURL = self.applicationDocumentsDirectory.URLByAppendingPathComponent(storeFileName)
            var error: NSError? = nil
            _persistentCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            if _persistentCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil, error: &error) == nil {
                abort()
            }
            
            return _persistentCoordinator!
            
        } else {
            return _persistentCoordinator!
        }
    }
    
    var applicationDocumentsDirectory: NSURL {
    let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.endIndex-1] as NSURL
    }
}
