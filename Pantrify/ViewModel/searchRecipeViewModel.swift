//
//  searchRecepieViewModel.swift
//  Pantrify
//
//  Created by Meena Ibrahim on 1/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//




import Foundation

import UIKit


class searchRecipeViewModel {
    
    //Creating connection to REST_Request
    private var model = SearchRecipeREST_Request.shared
    
    //Creating connection to Pantry to get ingredients
    private var pantry = PantryManager.shared
    
    // Array to store extracted ingredients
    var temporaryIngredients = [String] ()
    
    

    //Delegate to handle data timing
    var delegate : UpdateTable? {
        
        get{
            return model.delegate
        }
        set (value){
            model.delegate = value
        }
    }
    
    var count : Int {
        
        return recipes.count
        
    }
    
    //Variable returning found matching recipes
    var recipes : [SearchRecipeModel]{
        
        return model.recipes
        
        
    }
    
    // Returning recipe title
    func getTitleFor(index : Int) -> String{
        return recipes[index].title
    }
    
    // Returning recipe ID
    func getIDFor(index : Int) -> String{
        return recipes[index].ID
    }
    
    
    // Returning recipe Image
    func getImageFor(index: Int) -> UIImage? {
    
        let url = recipes[index].imageURL
        guard let imageURL = URL (string:  url) else { return nil}
        let data = try? Data (contentsOf: imageURL)
        let image : UIImage? = nil
        if let imageData = data{
            return UIImage (data: imageData)
        }
        
        return image
    }
    
    // Returning recipe ingredients
    func getIngredientsFor(index: Int) -> [String] {
        return recipes[index].ingredients
        
    }
    
    //Returning recipe method
    func getMethodFor(index: Int) -> String {
     return recipes[index].mealMethod
        
    }
    
    //Returning matching recipe ingredients as a string
    func getIngredientsAsStringFor(index: Int) -> String {
        var ingredients = ""
        
        for i in recipes[index].ingredients {
            
            ingredients = ingredients + i + "-"
        }
        
        return ingredients
    }
    
   
   // Loading recipes by extracting ingredients from Pantry and use them to call REST Request to get matching recipies
   func getRecipe(){
    
        var ingredients : String = ""
    
        // Clearing any existing ingredients
        temporaryIngredients = []
    
    
        //Extracting ingredients
        for p in pantry.newPantryItem {
            guard let itemName = p.itemName else {return}
            
            //Avoiding duplication and empty strings
            if !temporaryIngredients.contains(itemName) , !itemName.isEmpty {
                
                  temporaryIngredients.append(itemName)
            }
         
      }
    
      // Avoiding app crash if temporaryIngredients is empty
      if (temporaryIngredients.count>0){
        
        //Assigning the first position of the array to the first position of the string to avoid having an unnecessary comma at the start or at the end of the ingredients string (which spoils the search)
          ingredients = temporaryIngredients [0]
       }
    
       // Converting ingredients array into a string of ingredients to be able to add to REST Request
       var x = 1
    
       while x < temporaryIngredients.count{
           ingredients = ingredients + "," + temporaryIngredients[x]
           x += 1
       }
    
       // Calling REST request by searching for matching recipes with extracted pantry ingredients
       model.getRecipe(withIngredients: ingredients)
    
    
       print(ingredients)
    }
   
    
    // Returning a tuple with all matching meal details at a specific index in the recipes array
    func getMeal (byIndex index:Int) -> (mealName:String,mealMethod:String,image:UIImage?, ingredients:[String]){
        
        let mealName = getTitleFor(index: index)
        let ingredients = getIngredientsFor(index: index)
        let mealMethod = getMethodFor(index: index)
        
        let image = getImageFor(index: index)
        
        return (mealName, mealMethod, image, ingredients)
        
    }
}















