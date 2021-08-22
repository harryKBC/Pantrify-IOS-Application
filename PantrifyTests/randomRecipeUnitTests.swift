//
//  randomRecipeUnitTests.swift
//  PantrifyTests
//
//  Created by Harrison Kinbacher on 9/11/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import XCTest
@testable import Pantrify

class randomRecipeUnitTests: XCTestCase{
 
    
    override func setUp() {
        
    
    }
    
    override func tearDown() {
        
        
    }
    
    //test showing incorrect image handeling in model file and how other data is handled if image is corrupt
    func testIncorrectInput() {
        
        let plaaceHolder = RecipeAPI.init(method: "test1", recipeImageURL: "test2", recipeTitle: "test3", ingredients: ["test1","test2","test3"])
        
        let model = randomRecipesViewModel()
        model.request.recievedRecipes.append(RecipeAPI.init(method: "test1", recipeImageURL: "test2", recipeTitle: "test3", ingredients: ["test1","test2","test3"]))
    
        let test1 = model.getMeal(arrayIndex: 0)
        
        XCTAssert(test1.mealMethod == plaaceHolder.method)
        
         XCTAssert(test1.mealName == plaaceHolder.recipeTitle)
        
        XCTAssert(test1.ingredients == plaaceHolder.ingredients)
        
        
    }
    
    
    //correct image format test showing how other data is handled if image is not corrupt
    func testCorrectImageInput() {
        
        let plaaceHolder = RecipeAPI.init(method: "test1", recipeImageURL: "test2", recipeTitle: "test3", ingredients: ["test1","test2","test3"])
        
        let model = randomRecipesViewModel()
        
         model.request.recievedRecipes.append(RecipeAPI.init(method: "test1", recipeImageURL: "https:www.themealdb.com/images/media/meals/qqwypw1504642429.jpg", recipeTitle: "test3", ingredients: ["test1","test2","test3"]))
        
        let test1 = model.getMeal(arrayIndex: 0)
        
        XCTAssert(test1.mealMethod == plaaceHolder.method)
        
        XCTAssert(test1.mealName == plaaceHolder.recipeTitle)
        
        XCTAssert(test1.ingredients == plaaceHolder.ingredients)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //array count function test
    func testArrayLoop() {
        
        let model = randomRecipesViewModel()
        
        
        // adding 4 items to the test
        
        model.request.recievedRecipes.append(RecipeAPI.init(method: "test1", recipeImageURL: "https:www.themealdb.com/images/media/meals/qqwypw1504642429.jpg", recipeTitle: "test3", ingredients: ["test1","test2","test3"]))
        
         model.request.recievedRecipes.append(RecipeAPI.init(method: "test1", recipeImageURL: "https:www.themealdb.com/images/media/meals/qqwypw1504642429.jpg", recipeTitle: "test3", ingredients: ["test1","test2","test3"]))
        
         model.request.recievedRecipes.append(RecipeAPI.init(method: "test1", recipeImageURL: "https:www.themealdb.com/images/media/meals/qqwypw1504642429.jpg", recipeTitle: "test3", ingredients: ["test1","test2","test3"]))
        
         model.request.recievedRecipes.append(RecipeAPI.init(method: "test1", recipeImageURL: "https:www.themealdb.com/images/media/meals/qqwypw1504642429.jpg", recipeTitle: "test3", ingredients: ["test1","test2","test3"]))
        
        
        
        XCTAssert(model.counter == 4)
       
        
    }
    
    //test to check the struct RecipeAPI can contain the correct data
    func testStructInit() {
        
        let model = RecipeAPI(method: "String", recipeImageURL: "test Image Storage", recipeTitle: "Title", ingredients: ["String","test2","test3"])
        
        XCTAssert(model.ingredients == ["String", "test2","test3"])
        XCTAssert(model.method == "String")
        XCTAssert(model.recipeImageURL == "test Image Storage")
        XCTAssert(model.recipeTitle == "Title")
        
        
    }
    
    //test to check the struct meal can contain the correct data
    func testStructInit2() {
        
        let model = meal(name: "String", image: "String", method: "String", ingredients: ["String","test","test2"])
        
        XCTAssert(model.ingredients == ["String", "test","test2"])
        XCTAssert(model.method == "String")
        XCTAssert(model.image == "String")
        XCTAssert(model.name == "String")
        
        
    }
    
    //this test will check if the function to clear all pulled recipes correctly works
    
    func testAPISetToNil() {
        
        let model = Request()
        
        //adding two items to the array
         model.recievedRecipes.append(RecipeAPI.init(method: "test1", recipeImageURL: "https:www.themealdb.com/images/media/meals/qqwypw1504642429.jpg", recipeTitle: "test3", ingredients: ["test1","test2","test3"]))
        
        model.recievedRecipes.append(RecipeAPI.init(method: "test1", recipeImageURL: "https:www.themealdb.com/images/media/meals/qqwypw1504642429.jpg", recipeTitle: "test3", ingredients: ["test1","test2","test3"]))
        
        //checking if they have been added correctly
        XCTAssert(model.recievedRecipes.count == 2)
       
        //resetting the array
        model.setToNull()
        
        //checking if the array has been reset
        XCTAssert(model.recievedRecipes.count == 0)
    }

    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            
        }
    }
   
    

}
