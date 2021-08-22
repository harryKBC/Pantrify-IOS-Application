//
//  PantrifyTests.swift
//  PantrifyTests
//
//  Created by Harrison Kinbacher on 13/9/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import XCTest
@testable import Pantrify

class PantrifyTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
  
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
           
        }
    }
    
    
    /*  Pantry Model
     - Adding an item
     - Testing array stores data
     - Deleting an item from Array
     - Testing the load funciton for the array
     */
    
    //    Test for adding items into the pantry
    //    N.B. due to persistence running this test will populate data
    func testAddingPantryItem() {
        
        //        Connection to Pantry Model file
        let pantry = PantryManager()

        //Clearing Pantry before test
        pantry.newPantryItem.removeAll()
        
        //        Using mock data for the test
        pantry.addPantryItem("Apple", 1)
        
        //        Printing out the result of the array wo see the item has been added
        print(pantry.newPantryItem.count)
        
        //        Assertion tests to verify
        XCTAssertEqual(pantry.newPantryItem[0].itemName,"Apple")
        XCTAssertEqual(pantry.newPantryItem[0].itemNumber,1)
        
        //        Deleting item form the Pantry Array
        pantry.deletePantryItem(index:0)
    }
    
    //
    func testPantryArray() {
        //        Conneciton to Pantry Model File
        let pantry = PantryManager()
        
        //Clearing Pantry before test
        pantry.newPantryItem.removeAll()
        
        
        //        Adding item to Pantry Array
        pantry.addPantryItem("Chicken", 1)
        
        //        Assertion test to
        XCTAssertEqual(pantry.newPantryItem[0].itemName, "Chicken")
        XCTAssertEqual(pantry.newPantryItem[0].itemNumber, 1)
        
        //        Printing to console number of Pantry Items
        print("Pantry Count \(pantry.newPantryItem.count)")
        
        //        Deleting item form the Pantry Array
        pantry.deletePantryItem(index:0)
    }
    
    //    Deleting an item name and ingredient from the Pantry Array
    func testDeletePantryItem() {
        
        //        Connection to Pantry Model file
        let pantry = PantryManager()
        
        
        //Clearing Pantry before test
        pantry.newPantryItem.removeAll()
        
        //        Printing to console number of Pantry Items
        print("Pantry Count \(pantry.newPantryItem.count)")
        
        //        Adding item to Pantry Array to run the delete test
        pantry.addPantryItem("Beef", 1)
        //        Printing to console number of Pantry Items
        print("Pantry Count \(pantry.newPantryItem.count)")
        
        //        Assertion Test to verify item has been deleted with fail message
        XCTAssertEqual(pantry.newPantryItem[0].itemName, "Beef")
        XCTAssertEqual(pantry.newPantryItem[0].itemNumber, 1)
        
       
        //        Printing to console number of Pantry Items
        print("Pantry Count \(pantry.newPantryItem.count)")
        
        //        Deleting item form the Pantry Array
        pantry.deletePantryItem(index:0)
    }
    
    //    Test  if pantry load stored items in array
    func testLoadPantryItem() {
        
        //        Connection to Pantry Model file
        let pantry = PantryManager()
        
        
        //Clearing Pantry before test
        pantry.newPantryItem.removeAll()
        
        pantry.addPantryItem("Chicken", 1)
        
        XCTAssertNotNil(pantry.newPantryItem, "Chicken")
        print("Pantry Count \(pantry.newPantryItem.count)")
        
        //        Deleting item form the Pantry Array
        pantry.deletePantryItem(index:0)
    }
    
    func testItemName() {
        
        //        Connection to Pantry Model file
        let pantry = PantryManager()
        
        
        //Clearing Pantry before test
        pantry.newPantryItem.removeAll()
        
        //        Adding a new item into pantry array
        pantry.addPantryItem("Test", 1)
        
        //        Testing name of the new item added
        XCTAssertEqual(pantry.newPantryItem[0].itemName!, "Test")
        
        //        deleting added item in pantry
        pantry.deletePantryItem(index:0)
    }
    
    
    func testNumber() {
        
        let pantry = PantryManager()
        
        //pantry.deletePantryItem(index:0)
        
        print("Pantry Count \(pantry.newPantryItem.count)")
    }
    
    /*
     Pantry View Model
     - increases the item number of the stored ingredient
     - Decreases the item number of the stored ingredient
     */
    
    //    Test for 'Increasing' the number of items of a single ingredient
    func testIncreasePantryItem() {
        
        let pantry = PantryManager()
        
        
        //Clearing Pantry before test
        pantry.newPantryItem.removeAll()
        
        //        creating a new item in array
        pantry.addPantryItem("Test", 1)
        
        //        Quantity of item at array index 0
        print("Added pantry item name is \(pantry.newPantryItem[0].itemName!)")
        print("Added pantry item Quantity is \(pantry.newPantryItem[0].itemNumber)")
        
        //        Increasing the quantity item at array index 0 by 1
        pantry.newPantryItem[0].itemNumber += 1
        
        //        Item increases in quantity by 1 at array index 0
        print("Pantry item Quantity is \(pantry.newPantryItem[0].itemNumber)")
        
        //        Testing assertion for number has increased value greater than 1
        XCTAssertGreaterThanOrEqual(pantry.newPantryItem[0].itemNumber, 1)
        
        //        Deleting item form the Pantry Array
        pantry.deletePantryItem(index:0)
    }
    
    //    Test for 'Decreasing' the number of items of a single ingredient
    func testDecreasePantryItem() {
        
        //        Connection to Pantry Model file
        let pantry = PantryManager()
        
        
        //Clearing Pantry before test
        pantry.newPantryItem.removeAll()
        
        //        creating a new item in array
        pantry.addPantryItem("Test", 1)
        
        //        Prints the name of the added item at array index 0
        print(pantry.newPantryItem[0].itemName!)
        
        //        Quantity of item at array index 0
        print(pantry.newPantryItem[0].itemNumber)
        
        //        Increasing the quantity item at array index 0 by 1
        pantry.newPantryItem[0].itemNumber -= 1
        
        //        Item increases in quantity by 1 at array index 0
        print(pantry.newPantryItem[0].itemNumber)
        
        XCTAssertLessThan(pantry.newPantryItem[0].itemNumber, 2)
        
        //        Deleting item form the Pantry Array
        pantry.deletePantryItem(index:0)
        
    }
}
