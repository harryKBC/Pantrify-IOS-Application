//
//  AddSLItemViewModel.swift
//  Pantrify
//
//  Created by Julian Rich on 27/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import Foundation
import UIKit


struct AddSLItemViewModel {
    
    private var shoppingListManager = ShoppingListManager.shared
    
    
    //Closure for use with alertAction in shoppingList scene
    let resetList:(ShoppingListManager) -> Void = {(manager) -> Void in
        manager.clearShoppingList()
    }
    
    
    func getShoppingListManager() -> ShoppingListManager{
        return shoppingListManager
    }
    
    
    //Displays all the names of ShoppingListItems 
    var shoppingListItemNames:String{
        
        var result:String = ""
        
        let listItems = shoppingListManager.shoppingList
        
        for(_,shoppingListItem) in listItems.enumerated(){
            
            if let name = shoppingListItem.name{
                
                result += name + "\n"
            }
        }
        return result
    }
    
    
    mutating func addShoppingListItem(_ name:String,_ quantity:Int16,_ category:String){
        
        shoppingListManager.addShoppingListItem(name, quantity, category)
        
    }
    
    
    func getShoppingListItem(byIndex index:Int) -> ShoppingListItem{
        
        let item:ShoppingListItem = shoppingListManager.shoppingList[index]
        return item
        
    }
    
    func getListCount() -> Int
    {
        return shoppingListManager.shoppingList.count
    }
    
    
    //Allows the removal of items from the collection but keeps encapsulation.
    mutating func removeListItem(index:Int){
        
        shoppingListManager.removeListItem(index:index)
        
    }
    
    
    //Increase the number of items for an item.
    mutating func increaseQty(index:Int){
        
        shoppingListManager.increaseQty(index: index)
    }
    
    
    //Decrease the number of items for an item.
    mutating func decreaseQty(index:Int){
        
        shoppingListManager.decreaseQty(index: index)
        
    }
    
}
