//
//  PantryManager.swift
//  Pantrify
//
//  Created by Jerry Rousseau on 29/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PantryManager {
    
    //    Creating a singleton
    static let shared = PantryManager()
    
    //    Reference to App Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let managedContext: NSManagedObjectContext
    
    //    Memory property for storing data
    var newPantryItem:[PantryItems] = []
    
    init() {
        
        managedContext = appDelegate.persistentContainer.viewContext
        
        loadPantryItem()
    }
    
    //    Function to store ifnromation into core data
    private func createNSPantryItem(_ itemName: String,_ itemNumber: Int16) -> PantryItems {
        let pantryEntity = NSEntityDescription.entity(forEntityName: "PantryItems", in: managedContext)!
        
        let nsPantry = NSManagedObject(entity: pantryEntity, insertInto: managedContext) as! PantryItems
        
        nsPantry.setValue(itemName, forKeyPath: "itemName")
        nsPantry.setValue(itemNumber, forKeyPath:  "itemNumber")
        
        return nsPantry
    }
    
    //    Function to call view model
    func addPantryItem(_ itemName: String,_ itemNumber: Int16) {
        
        //        Appends items into the array
        let nsPantry = createNSPantryItem(itemName,1)
        newPantryItem.append(nsPantry)
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Did not save \(error),\(error.userInfo)")
        }
    }
    
    func deletePantryItem(index:Int) {
        
        managedContext.delete(newPantryItem[index])
        
        newPantryItem.remove(at:index)
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Did not save \(error),\(error.userInfo)")
        }
    }
    
//    Function populates pre-existing data into the table.
    func loadPantryItem() {
        
        do{
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PantryItems")
            
            let results = try managedContext.fetch(fetchRequest)
            newPantryItem = results as! [PantryItems]
        }
        catch let error as NSError {
            print("Could not load \(error),\(error.userInfo)")
        }
    }
    
//    Function for increasing number of items
    func increasePantryItem(index: Int) {
        
        newPantryItem[index].itemNumber += 1
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not Increase \(error),\(error.userInfo)")
        }
    }
    
//    Funciton for Decreasing number of items
    func decreasePantryItem(index: Int) {
        
        var numPantryItems = newPantryItem[index].itemNumber
        
        if numPantryItems == 1 {
            
        }
        
        else {
            numPantryItems -= 1
            newPantryItem[index].itemNumber = numPantryItems
        }
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not deccrease \(error),\(error.userInfo)")
        }
    }
    
    
}

