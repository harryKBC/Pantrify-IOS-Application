//
//  ShoppingListManager.swift
//  Pantrify
//
//  Created by Julian Rich on 27/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol RefreshTable{
    func refreshTable()
}

class ShoppingListManager{
    
    //Creates a singleton of this object.
    static let shared = ShoppingListManager()
    
    var delegate:RefreshTable?
    
    //Gets a reference to the appDelegate class.
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //This is the object that allows us to reference the underlying database system.
    let managedContext: NSManagedObjectContext
    
    private (set) var shoppingList:[ShoppingListItem] = []
    
    
    private init(){
        //Boilplate code needed for CoreData functionality.
        managedContext = appDelegate.persistentContainer.viewContext
        loadShoppingListItems()
    }
    
    
    //Creates a ShoppingListItem that can be stored within CoreData database.
    private func createNSSHoppingListItem(_ name: String,_ quantity: Int16,_ category: String) -> ShoppingListItem{
        
        //Creates a reference to the shoppingListItem entity type with CoreData. This is a custom type.
        let shoppingListEntity = NSEntityDescription.entity(forEntityName:
            "ShoppingListItem", in:managedContext)!
        
        //This creates the actual NSManagedObject that can be stored within CoreData.
        let nsShoppingListItem = NSManagedObject(entity: shoppingListEntity, insertInto: managedContext) as! ShoppingListItem
        
        //Sets the property values for the ShoppingListItem object.
        nsShoppingListItem.setValue(name, forKeyPath: "name")
        nsShoppingListItem.setValue(quantity, forKeyPath: "quantity")
        nsShoppingListItem.setValue(category, forKeyPath: "category")
        
        
        //return.
        return nsShoppingListItem
    }
    
    
    //Creates then adds item to shoppingList array then database.
    func addShoppingListItem(_ name:String,_ quantity:Int16,_ category:String){
        
        //Checks for non-nil name parameter.
        if name == "" {
            print("name was empty. No item was created")
            return
        }
        
        print("********Quantity is:\(quantity)")
        
        //Check for non-negative quantity
        if quantity < 1{
            print("Quantity was negative. No item was created")
            return
        }
        
        //Puts it in the array.
        let nsShoppingListItem = createNSSHoppingListItem(name,1,category)
        shoppingList.append(nsShoppingListItem)
        
        //Puts in the database. The entity has already been created and placed in the managedContext.
        //So all that needs to be done is for the managedContext to save.
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    //Populates the shoppingList array with the stored entities.
    func loadShoppingListItems(){
        do{
            //This is similar to a database query. Its looking for objects of the type ShoppingListItem
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ShoppingListItem")
            
            //This is the result of checking the database for objects matching the entity name above aka "ShoppingListItem"
            let results = try managedContext.fetch(fetchRequest)
            shoppingList = results as! [ShoppingListItem]
            
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    //Removes ShoppingList Items.
    func removeListItem(index:Int){
        
        //Marks this ManagedObject for deletion at next save.
        managedContext.delete(shoppingList[index])
        
        //Remove the item from the shoppingList.
        shoppingList.remove(at:index)
        
        //Save the new state of the shoppingList.
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error),\(error.userInfo)")
        }
        
    }
    
    //Clears the shoppinglist and saves the new state of these objects in the NSManagedObjectContext.
    func clearShoppingList(){
        
        //Marks these ManagedObjects for deletion at next save.
        for (index, _) in shoppingList.enumerated(){
            managedContext.delete(shoppingList[index])
        }
        
        //Remove all the items from the ShoppingList.
        shoppingList.removeAll()
        print("********SHOPPING LIST CLEARED*****************")
        
        //Save the new state of the shoppingList.
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
        
        //Makes SLViewController perform SLTableView.reloadData()
        delegate?.refreshTable()
    }
    
    
    func increaseQty(index:Int){
        
        shoppingList[index].quantity += 1
        
        //Saves changes.
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error),\(error.userInfo)")
        }
        
    }
    
    func decreaseQty(index:Int){
        
        var quant = shoppingList[index].quantity
        
        if quant == 1{
            //do nothing
        }
        else{
            //Updates the value of itemQuant for the particular shoppingListItem.
            quant -= 1
            shoppingList[index].quantity = quant
        }
        
        //Saves changes.
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error),\(error.userInfo)")
        }
        
    }
    
    
    func isDuplicate(newItemName:String)-> Bool{
        
        //if the shopping list is not empty
        if shoppingList.isEmpty == false{
            
            //check each item in the shoppingList
            for (index,_) in shoppingList.enumerated(){
                //If the item at any index matches the newItemName...
                if(shoppingList[index].name == newItemName){
                    print("\nName matches existing item in list.")
                    //...return true.
                    return true
                }
            }
            
        }
        
        return false
    }
    
    
    
    
}
