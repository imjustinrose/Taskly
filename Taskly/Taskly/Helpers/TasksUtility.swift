//
//  TasksUtility.swift
//  Taskly
//
//  Created by Justin Rose on 2/17/18.
//  Copyright © 2018 justncode, LLC. All rights reserved.
//

import Foundation

class TasksUtility {
    
    private static let key = "tasks"
    
    // archive
    private static func archive(_ tasks: [[Task]]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: tasks) as NSData
    }
    
    // fetch
    static func fetch() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        
        return NSKeyedUnarchiver.unarchiveObject(with: unarchivedData) as? [[Task]]
    }
    
    // save
    static func save(_ tasks: [[Task]]) {
        
        // Archive
        let archivedTasks = archive(tasks)
        
        // Set object for key
        UserDefaults.standard.set(archivedTasks, forKey: key)
        UserDefaults.standard.synchronize()
        
        
    }
}
