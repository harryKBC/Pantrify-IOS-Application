//
//  SearchRecipeUITests.swift
//  PantrifyUITests
//
//  Created by Meena Ibrahim on 14/11/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import XCTest

class SearchRecipeUITests: XCTestCase {

    override func setUp() {
        super.setUp()
       
        continueAfterFailure = false
        
        
        XCUIApplication().launch()
        XCUIDevice.shared.orientation = .portrait
      
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testSearchRecipe() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        
        //Ensuring test starts in portrait mode
        XCUIDevice.shared.orientation = .portrait
        
        //App loads and selects Search Recipe
        sleep(5)
        let searchRecipeButton = tabBarsQuery.buttons["Search Recipe"]
        searchRecipeButton.tap()
        
        sleep(2)
        let tablesQuery = app.tables
        
        //Swiping up and down to scroll through displayed recipes
        sleep(2)
        tablesQuery.children(matching: .cell).element(boundBy: 6).swipeUp()
        
        sleep(2)
        tablesQuery.children(matching: .cell).element(boundBy: 15).swipeDown()
        
        //Changing to landscape view (right)
        sleep(2)
        XCUIDevice.shared.orientation = .landscapeRight
        
        
        //Swiping up and down to scroll through recipes in the landscape view
        sleep(2)
        tablesQuery.children(matching: .cell).element(boundBy: 4).swipeUp()
        
        sleep(2)
        tablesQuery.children(matching: .cell).element(boundBy: 4).swipeDown()
        
        //Back to portrait
        sleep(2)
        XCUIDevice.shared.orientation = .portrait
        
        //Selecting a displayed meal
        let select = tablesQuery.children(matching: .cell).element(boundBy: 0)
        
        sleep(2)
        select.tap()
        
        //Swiping up and down to scroll through the selected meal details
        let scrollViewsQuery = app.scrollViews
        let methodStaticText = scrollViewsQuery.otherElements.staticTexts["Method"]
        
        sleep(2)
        methodStaticText.swipeUp()
        
        sleep(2)
        methodStaticText/*@START_MENU_TOKEN@*/.swipeDown()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        
        
        //Changing view to landscape
        sleep(2)
        XCUIDevice.shared.orientation = .landscapeLeft
        
        
        //Swiping up and down to go through selected meal details in the landscape view
        let elementsQuery = app.scrollViews.otherElements
        
        let landScapeScroll1 = elementsQuery.children(matching: .image).element(boundBy: 0)
        
        let landScapeScroll2 = elementsQuery.children(matching: .textView).element(boundBy: 1)
        
        sleep(3)
        landScapeScroll1.swipeUp()
        
        sleep(2)
        landScapeScroll2.swipeDown()
        
        
        //Back to portrait
        sleep(3)
        XCUIDevice.shared.orientation = .portrait
        
        
        //Adding ingredients of selected meal to shopping list
        let pantrifyPantrifydetailviewNavigationBar = app.navigationBars["Pantrify.pantrifyDetailView"]
        
        sleep(3)
        pantrifyPantrifydetailviewNavigationBar.buttons["Add Ingredients"].tap()
        
        //Confirming addition
        sleep(3)
        app.alerts["Add Ingredients?"].buttons["OK"].tap()
        
        
        //Checking ingredients has been added to the shopping list
        sleep(3)
        tabBarsQuery.buttons["Shopping List"].tap()
        
        //Reseting  list to remove added items
        sleep(2)
        let resetListButton = app.navigationBars["Shopping List"].buttons["  Reset List"]
        resetListButton.tap()
        
        //Confirming reset
        sleep(2)
        let resetListAlert = app.alerts["Reset list?"]
        resetListAlert.buttons["Reset list"].tap()
        
        
        //Back to selected meal
        sleep(2)
        tabBarsQuery.buttons["Search Recipe"].tap()
        
        //Back to Search Recipe scene
        sleep(2)
        pantrifyPantrifydetailviewNavigationBar.buttons["Search Recipe"].tap()
        
        //Going to Pantry scene to add different ingredients
        sleep(3)
        tabBarsQuery.buttons["Pantry"].tap()
        
        //Adding Pantry item
        sleep(3)
        app/*@START_MENU_TOKEN@*/.textFields["PantryTextField"]/*[[".textFields[\"Enter Ingredient e.g. Eggs\"]",".textFields[\"PantryTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        sleep(1)
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        sleep(1)
        let gKey = app/*@START_MENU_TOKEN@*/.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gKey.tap()
        gKey.tap()
        
        
        
        sleep(2)
        app/*@START_MENU_TOKEN@*/.buttons["PantryAddItemButton"]/*[[".buttons[\"Add Item\"]",".buttons[\"PantryAddItemButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        sleep(2)
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        sleep(1)
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //Going back to Search Recipe to refresh matching meals
        sleep(2)
        //tabBarsQuery.buttons["Search Recipe"].tap()
        searchRecipeButton.tap()
        
        
        sleep(2)
        app.navigationBars["Search Recipe"].buttons["Item"].tap()
        
        //Selecting a displayed meal
        let select2 = tablesQuery.children(matching: .cell).element(boundBy: 0)
        
        sleep(5)
        select2.tap()
        
        sleep(2)
        app.navigationBars["Pantrify.pantrifyDetailView"].buttons["Search Recipe"].tap()
        
        
        //Going back to pantry to delete the entry
        sleep(3)
        tabBarsQuery.buttons["Pantry"].tap()
        
        
        
        //Deleting entry
        let tablesQuery2 = tablesQuery
        let deleteButton = tablesQuery.buttons["Delete"]
        
        sleep(2)
        //tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["egg"]/*[[".cells.staticTexts[\"egg\"]",".staticTexts[\"egg\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        
        
        //deleteButton.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["itemLabel"]/*[[".cells",".staticTexts[\"fish\"]",".staticTexts[\"itemLabel\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        
        sleep(2)
        deleteButton.tap()
        
        //Adding Pantry item
        sleep(3)
        app/*@START_MENU_TOKEN@*/.textFields["PantryTextField"]/*[[".textFields[\"Enter Ingredient e.g. Eggs\"]",".textFields[\"PantryTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        sleep(1)
        let bKey = app.keys["b"]
        bKey.tap()
        
        sleep(1)
        eKey.tap()
        eKey.tap()
        
        let fKey = app.keys["f"]
        fKey.tap()
        
        sleep(2)
        app/*@START_MENU_TOKEN@*/.buttons["PantryAddItemButton"]/*[[".buttons[\"Add Item\"]",".buttons[\"PantryAddItemButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        sleep(2)
        
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        sleep(1)
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //Going back to Search Recipe to refresh matching meals
        sleep(2)
        //tabBarsQuery.buttons["Search Recipe"].tap()
        searchRecipeButton.tap()
        
        
        sleep(2)
        app.navigationBars["Search Recipe"].buttons["Item"].tap()
        
        //Selecting a displayed meal
        sleep(5)
        select2.tap()
        
        sleep(2)
        app.navigationBars["Pantrify.pantrifyDetailView"].buttons["Search Recipe"].tap()
        
        
        //Going back to pantry to delete the entry
        sleep(3)
        tabBarsQuery.buttons["Pantry"].tap()
        
        
        
        //Deleting entry
        sleep(2)
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["itemLabel"]/*[[".cells",".staticTexts[\"fish\"]",".staticTexts[\"itemLabel\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        
        sleep(2)
        deleteButton.tap()
        
        //Back to Search recipe to another refresh
        sleep(2)
        tabBarsQuery.buttons["Search Recipe"].tap()
        
        sleep(2)
        app.navigationBars["Search Recipe"].buttons["Item"].tap()
        
        sleep(5)
        
    }
    
    
  

    

}
