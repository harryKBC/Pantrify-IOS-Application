//
//  PantrifyUITests.swift
//  PantrifyUITests
//
//  Created by Harrison Kinbacher on 13/9/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import XCTest

class PantrifyUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        
        XCUIApplication().launch()
        XCUIDevice.shared.orientation = .portrait
       
    }

    override func tearDown() {
       
        super.tearDown()
    }

    

    func testRandomRecipe() {
        
        let app = XCUIApplication()
        sleep(15)
        
        let cell = app.collectionViews.element(boundBy: 0).cells.element(boundBy: 5)
        cell.staticTexts.element(boundBy: 0).tap()
        sleep(5)
        app.navigationBars["Pantrify.pantrifyDetailView"].buttons["Recipes of the Day"].tap()
    }
    
//    
    func testRandomRecipesNormalRun(){
        
        let app = XCUIApplication()
        sleep(10)
        XCUIDevice.shared.orientation = .landscapeRight
        sleep(5)
        
        let cell = app.collectionViews.element(boundBy: 0).cells.element(boundBy: 5)
        
        cell.staticTexts.element(boundBy: 0).tap()
        sleep(5)
        
         let chickenAlfredoPrimaveraElement = app.scrollViews.otherElements.containing(.staticText, identifier:"Method").element
        
        chickenAlfredoPrimaveraElement.swipeUp()
        chickenAlfredoPrimaveraElement.swipeDown()  
        
        app.navigationBars["Pantrify.pantrifyDetailView"].buttons["Recipes of the Day"].tap()
        XCUIDevice.shared.orientation = .portrait
    }
    
    func testRandomRecipesViewChange() {
    
        let app = XCUIApplication()
        
        XCUIDevice.shared.orientation = .landscapeRight
    
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        sleep(5)
        collectionView.swipeUp()
   
        sleep(5)
         collectionView.swipeDown()
 
        
        sleep(5)
        let cell = app.collectionViews.element(boundBy: 0).cells.element(boundBy: 5)
        
        cell.staticTexts.element(boundBy: 0).tap()
    
        let chickenAlfredoPrimaveraElement = app.scrollViews.otherElements.containing(.staticText, identifier:"Method").element
        chickenAlfredoPrimaveraElement.swipeUp()
        
        sleep(5)
        chickenAlfredoPrimaveraElement.swipeDown()
      
        sleep(5)
        app.navigationBars["Pantrify.pantrifyDetailView"].buttons["Recipes of the Day"].tap()
        XCUIDevice.shared.orientation = .portrait
    }
    
//    Original UITest that worked on previous commit 12/11
    func testPantryScreen() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Pantry"].tap()
        
        let pantrytextfieldTextField = app/*@START_MENU_TOKEN@*/.textFields["PantryTextField"]/*[[".textFields[\"Enter Ingredient e.g. Eggs\"]",".textFields[\"PantryTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pantrytextfieldTextField.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        let gKey = app/*@START_MENU_TOKEN@*/.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gKey.tap()
        gKey.tap()
        
        let pantryadditembuttonButton = app/*@START_MENU_TOKEN@*/.buttons["PantryAddItemButton"]/*[[".buttons[\"Add Item\"]",".buttons[\"PantryAddItemButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pantryadditembuttonButton.tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        let fKey = app/*@START_MENU_TOKEN@*/.keys["f"]/*[[".keyboards.keys[\"f\"]",".keys[\"f\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        fKey.tap()
        
        let iKey = app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        
        let sKey = app/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sKey.tap()
        
        let hKey = app/*@START_MENU_TOKEN@*/.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hKey.tap()
        pantryadditembuttonButton.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"egg")/*@START_MENU_TOKEN@*/.buttons["PantryIncrease"]/*[[".buttons[\"+\"]",".buttons[\"PantryIncrease\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let eggCellsQuery = tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"egg")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"egg\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eggCellsQuery/*@START_MENU_TOKEN@*/.buttons["PantryIncrease"]/*[[".buttons[\"+\"]",".buttons[\"PantryIncrease\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"egg").buttons["PantryDecrease"]/*[[".cells.containing(.staticText, identifier:\"3\")",".buttons[\"-\"]",".buttons[\"PantryDecrease\"]",".cells.containing(.staticText, identifier:\"egg\")"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        eggCellsQuery/*@START_MENU_TOKEN@*/.buttons["PantryDecrease"]/*[[".buttons[\"-\"]",".buttons[\"PantryDecrease\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tablesQuery2 = tablesQuery
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["egg"]/*[[".cells.staticTexts[\"egg\"]",".staticTexts[\"egg\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        
        let deleteButton = tablesQuery.buttons["Delete"]
        deleteButton.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["itemLabel"]/*[[".cells",".staticTexts[\"fish\"]",".staticTexts[\"itemLabel\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        deleteButton.tap()
        XCUIDevice.shared.orientation = .landscapeRight
        pantrytextfieldTextField.tap()
        pantrytextfieldTextField.tap()
        
        let lKey = app/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        pantryadditembuttonButton.tap()
        returnButton.tap()
        
        let pantryincreaseButton = tablesQuery2/*@START_MENU_TOKEN@*/.buttons["PantryIncrease"]/*[[".cells",".buttons[\"+\"]",".buttons[\"PantryIncrease\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        pantryincreaseButton.tap()
        pantryincreaseButton.tap()
        
        let pantrydecreaseButton = tablesQuery2/*@START_MENU_TOKEN@*/.buttons["PantryDecrease"]/*[[".cells",".buttons[\"-\"]",".buttons[\"PantryDecrease\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        pantrydecreaseButton.tap()
        pantrydecreaseButton.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["itemLabel"]/*[[".cells",".staticTexts[\"lamb\"]",".staticTexts[\"itemLabel\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        deleteButton.tap()
        XCUIDevice.shared.orientation = .portrait
    }
    
    func testProfile() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Profile"].tap()
        
        let jeremiahElement = app.scrollViews.otherElements.containing(.staticText, identifier:"Jeremiah").element
        jeremiahElement.swipeUp()
        jeremiahElement.swipeDown()
        XCUIDevice.shared.orientation = .landscapeRight
        jeremiahElement.swipeLeft()
        jeremiahElement.swipeRight()
        
    }
}
