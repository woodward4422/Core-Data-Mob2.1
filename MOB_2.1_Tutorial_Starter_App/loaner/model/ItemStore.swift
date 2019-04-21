//
//  ItemStore.swift
//  loaner
//
//  Created by Noah Woodward on 4/20/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import UIKit
import CoreData

class ItemStore: NSObject {
    
    let persistentContainer: NSPersistentContainer = {
        // creates the NSPersistentContainer object
        // must be given the name of the Core Data model file “LoanedItems”
        let container = NSPersistentContainer(name: "LoanedItems")
        
        // load the saved database if it exists, creates it if it does not, and returns an error under failure conditions
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    
    func saveContext(){
        let viewContext = persistentContainer.viewContext
        if viewContext.hasChanges {
            do{
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unsolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
