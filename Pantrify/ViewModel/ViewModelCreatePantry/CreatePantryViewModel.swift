//
//  CreatePantryViewModel.swift
//  Pantrify
//
//  Created by Jerry Rousseau on 29/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import Foundation
import UIKit

struct CreatePantryViewModel {
    
//    Reference to Model
    private var pantryManager = PantryManager.shared
    
    var pantryList: String {
        
        var result: String = ""
        
        let listItems = pantryManager.newPantryItem
        
        for(_, pantryList) in listItems.enumerated() {
            
            if let name = pantryList.itemName {
                
                result += name + "\n"
            }
        }
        return result
    }
    
//    Adds new items
    mutating func addNewPantryItem(_ itemName: String,_ itemnumber: Int16) {
        
        //RESTRICTED PANTRY ITEM LIST
        if(pantryItemCount() <= 3){
            pantryManager.addPantryItem(itemName, itemnumber)
        }
    }
    
    
    func getPantryItem(byIndex index:Int) -> PantryItems {

        let pantryItem: PantryItems = pantryManager.newPantryItem[index]

        return pantryItem
    }

//    Count number of items stored
    func pantryItemCount() -> Int {

        return pantryManager.newPantryItem.count
    }
    
//    Delete Functionality for items
    mutating func deletePantryItem(index:Int) {
        
        pantryManager.deletePantryItem(index: index)
    }
    
//    Increases the number of items
    mutating func increasePantryItem(index: Int) {
        
        pantryManager.increasePantryItem(index: index)
    }
    
//    Decreases number of items
    mutating func decreasePantryitem(index: Int) {
        
        pantryManager.decreasePantryItem(index: index)
    }
}

