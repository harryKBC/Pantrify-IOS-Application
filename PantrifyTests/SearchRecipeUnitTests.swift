//
//  SearchRecipeUnitTests.swift
//  PantrifyTests
//
//  Created by Meena Ibrahim on 11/11/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import XCTest

@testable import Pantrify

class SearchRecipeUnitTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    
    //SearchRecipeModel instantiats properly and requires all atributes needed to be displayed
    func testSearchRecipeModel(){
        
        let title = "Test Title"
        let imageURL = "Test URL"
        let ID = "Test ID"
        let mealMethod = "Test Method"
        let ingredients = ["Test Ingredient 1", "Test Ingredient 2", "Test Ingredient 3"]
        let recipe = SearchRecipeModel(title: title,imageURL: imageURL,ID: ID,mealMethod: mealMethod,ingredients: ingredients)
        
        XCTAssertNotNil(recipe)
    }
    
    
    // Recipes array should be cleared before each search to display only latest search results
    func testRecipesArrayIsEmpty() {
        
        let model = SearchRecipeREST_Request.shared
        let viewModel = searchRecipeViewModel()
        
       XCTAssertTrue(viewModel.recipes.count == 0)
       XCTAssertEqual(model.recipes.count , 0)
    }

    
    //All ingredients listed in the pantry should be picked up and used to search for a matching recipe
    func testAllPantryItemsAreUsedInSearch() {
        
        let pantry = PantryManager.shared
        let viewModel = searchRecipeViewModel()
        
        //Adding duplicate items to the pantry
        pantry.newPantryItem = []
        pantry.addPantryItem("Chicken", 1)
        pantry.addPantryItem("Egg", 1)
        pantry.addPantryItem("Beef", 1)
        
        //Calling the method to load pantry ingredients
        viewModel.getRecipe()
        
        XCTAssertTrue(viewModel.temporaryIngredients.count == 3)
        
        XCTAssertNotEqual(viewModel.temporaryIngredients.count , 0)
        
        // Removing the test added pantry items
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
    }
    
    
    // Duplicate pantry items should not be added to 'temporaryIngredients' used in earch request
    func testDuplicatePantryitemsForbiddenInRESTRequest() {
        
        let pantry = PantryManager.shared
        let viewModel = searchRecipeViewModel()
        
        //Adding duplicate items to the pantry
        pantry.newPantryItem = []
        pantry.addPantryItem("Chicken", 1)
        pantry.addPantryItem("Chicken", 1)
        pantry.addPantryItem("Chicken", 1)
        
        //Calling the method to load pantry ingredients
        viewModel.getRecipe()
        
        XCTAssertTrue(viewModel.temporaryIngredients.count != 3)
        
        XCTAssertEqual(viewModel.temporaryIngredients.count , 1)
        
        // Removing the test added pantry items
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
    }
    
    // Empty pantry items should not be added to 'temporaryIngredients' used in search request
    func testEmptyPantryitemsForbiddenInRESTRequest() {
        
        let pantry = PantryManager.shared
        let viewModel = searchRecipeViewModel()
        
        //Adding duplicate items to the pantry
        pantry.newPantryItem = []
        pantry.addPantryItem("", 1)
        pantry.addPantryItem("", 1)
        pantry.addPantryItem("", 1)
        
        //Calling the method to load pantry ingredients
        viewModel.getRecipe()
        
        XCTAssertTrue(viewModel.temporaryIngredients.count != 3)
        
        XCTAssertEqual(viewModel.temporaryIngredients.count , 0)
        
        // Removing the test added pantry items
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
        pantry.deletePantryItem(index: pantry.newPantryItem.count - 1)
    }
    
    
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
           
        }
    }

}
