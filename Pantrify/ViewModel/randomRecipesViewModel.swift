//
//  randomRecipesViewModel.swift
//  Pantrify
//
//  Created by Harrison Kinbacher on 24/9/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

//random recipes functionality logic was obtained from tutorial week 5, implimented into the Pantrify app.

import Foundation
import UIKit

struct randomRecipesViewModel{
    
    // create a request which pull run the API pull
   
    var request = Request()
   
    var delegate:Refresh?{
        get{
            return request.delegate
        }
        set(value){
            request.delegate = value
        }
    }

    
    //simple initialiser
    func getData(){
        
        for _ in 1..<11{
            request.recipePull()
           
        }
        
    }
    
   
    
    init(){
        request.setToNull()
       // addMeals()
    }
    
    //returns an Int which gives us the size of the nmeals array used to generate total number of cells
    var counter:Int{
        
        return request.recievedRecipes.count
    }
    
    //getter function for the array, returns the recipe information
    
    func getMeal(arrayIndex:Int) ->(mealName:String,mealMethod:String, image:UIImage?, ingredients:[String]){
        
        
        let imageUrlString = request.recievedRecipes[arrayIndex].recipeImageURL
        let imageUrl:URL = URL(string: imageUrlString)!
        let imageData = try? Data(contentsOf: imageUrl)
        
        if(imageData != nil){
        
            let image = UIImage(data: imageData!)
            let mealName = request.recievedRecipes[arrayIndex].recipeTitle
            let mealMethod = request.recievedRecipes[arrayIndex].method
            let ingredients = request.recievedRecipes[arrayIndex].ingredients
    
            return (mealName, mealMethod, image, ingredients)
        }
        
        let image = UIImage()
        
        let mealName = request.recievedRecipes[arrayIndex].recipeTitle
        let mealMethod = request.recievedRecipes[arrayIndex].method
        let ingredients = request.recievedRecipes[arrayIndex].ingredients
        
        print("error with image")
        return (mealName, mealMethod, image, ingredients)
        
    }
    
    
   
    
}
