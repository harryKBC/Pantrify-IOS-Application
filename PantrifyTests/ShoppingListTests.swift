//
//  ShoppingListTests.swift
//  PantrifyTests
//
//  Created by Julian Rich on 2/11/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import XCTest
@testable import Pantrify

class ShoppingListTests: XCTestCase {
    
    
    /*Business Rules---------------------------
    1.Name property must not be empty
    2.Quantity must on be 1 on initialisation.

    -----------------------------------------*/
    

    override func setUp() {
       
        let manager = ShoppingListManager.shared
        
        manager.clearShoppingList()
    }

    override func tearDown() {
        
    }

    func testExample() {
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            
        }
    }
    
    func testShoppingListItem() {
        
        let manager = ShoppingListManager.shared
        
        manager.addShoppingListItem("", 1, "uncategorised")
        
        XCTAssertTrue(manager.shoppingList.count == 0)
    }
    
    func testQuantityEquals1(){
        
        let manager = ShoppingListManager.shared
        
        manager.addShoppingListItem("Ham", 0, "uncategorised")
        
        XCTAssertTrue(manager.shoppingList.count == 0)
        
    }

}
