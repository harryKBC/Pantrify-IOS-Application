//
//  ShoppingListUITests.swift
//  PantrifyUITests
//
//  Created by Julian Rich on 14/11/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import XCTest

class ShoppingListUITests: XCTestCase {
    
    override func setUp() {
          super.setUp()
        continueAfterFailure = false
        
      
        XCUIApplication().launch()
        XCUIDevice.shared.orientation = .portrait
        
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testShoppingList() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Shopping List"].tap()
        sleep(2)
        
        let resetListButton = app.navigationBars["Shopping List"].buttons["  Reset List"]
        resetListButton.tap()
        sleep(2)
        
        let resetListAlert = app.alerts["Reset list?"]
        resetListAlert.buttons["Reset list"].tap()
        sleep(2)
        
        app.textFields["add a new item here"].tap()
        sleep(5)
        let eKey = app/*@START_MENU_TOKEN@*/.keyboards.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        let gKey = app/*@START_MENU_TOKEN@*/.keyboards.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        gKey.tap()
        gKey.tap()
        
        let addItemButton = app.buttons["Add item"]
        addItemButton.tap()
        sleep(5)
        let tablesQuery = app.tables
        let button = tablesQuery/*@START_MENU_TOKEN@*/.buttons["+"]/*[[".cells.buttons[\"+\"]",".buttons[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button.tap()
        button.tap()
        sleep(2)
        let button2 = tablesQuery/*@START_MENU_TOKEN@*/.buttons["-"]/*[[".cells.buttons[\"-\"]",".buttons[\"-\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button2.tap()
        button2.tap()
        sleep(2)
        let app2 = app
        app2.tables/*@START_MENU_TOKEN@*/.staticTexts["egg"]/*[[".cells.staticTexts[\"egg\"]",".staticTexts[\"egg\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        sleep(2)
        let deleteKey = app2/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        sleep(2)
        
        let fKey = app2/*@START_MENU_TOKEN@*/.keys["f"]/*[[".keyboards.keys[\"f\"]",".keys[\"f\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        fKey.tap()
        
        let iKey = app2/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        
        let sKey = app2/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sKey.tap()
        
        let hKey = app2/*@START_MENU_TOKEN@*/.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hKey.tap()
        addItemButton.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(2)
        
        resetListButton.tap()
        resetListAlert.buttons["Reset list"].tap()
        sleep(2)
        
        addItemButton.tap()
        sleep(2)
        
        resetListButton.tap()
        resetListAlert.buttons["Cancel"].tap()
    }
    
    
    //  NOTE: Due to persistence please ensure that list is clear of any data.
    func testShoppingListLandscape() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Shopping List"].tap()
        sleep(2)
        
        let resetListButton = app.navigationBars["Shopping List"].buttons["  Reset List"]
        resetListButton.tap()
        sleep(2)
        
        let resetListAlert = app.alerts["Reset list?"]
        resetListAlert.buttons["Reset list"].tap()
        sleep(2)
        
        XCUIDevice.shared.orientation = .landscapeRight
        
        let addANewItemHereTextField = app.textFields["add a new item here"]
        addANewItemHereTextField.tap()
        addANewItemHereTextField.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        let gKey = app/*@START_MENU_TOKEN@*/.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gKey.tap()
        gKey.tap()
        sleep(2)
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let addItemButton = app.buttons["Add item"]
        addItemButton.tap()
        
        let tablesQuery = app.tables
        let button = tablesQuery/*@START_MENU_TOKEN@*/.buttons["+"]/*[[".cells.buttons[\"+\"]",".buttons[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button.tap()
        button.tap()
        sleep(2)
        
        let button2 = tablesQuery/*@START_MENU_TOKEN@*/.buttons["-"]/*[[".cells.buttons[\"-\"]",".buttons[\"-\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button2.tap()
        button2.tap()
        sleep(2)
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["egg"]/*[[".cells.staticTexts[\"egg\"]",".staticTexts[\"egg\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        sleep(2)
        
        addItemButton.tap()
        sleep(2)
        
        
        resetListButton.tap()
        resetListAlert.buttons["Reset list"].tap()
        sleep(2)
        
        addItemButton.tap()
        resetListButton.tap()
        resetListAlert.buttons["Cancel"].tap()
        sleep(2)
        
    }
    
   
    
}
