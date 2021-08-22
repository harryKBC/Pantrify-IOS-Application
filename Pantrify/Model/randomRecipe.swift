//
//  File.swift
//  Pantrify
//
//  Created by Julian Rich on 20/9/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import Foundation


// this is some data storage hard coded, used for the home page recipies of the day
// this will become dynamic once the api is implimented

struct RecipeAPI{
    var method: String
    var recipeImageURL:String
    var recipeTitle:String
    var ingredients = [String]()
    
    
}


//meals struct declaration
struct meal{
    var name: String
    var image: String
    var method: String
    var ingredients = [String]()
    //mutating func addIngredient(ingredient:String){
        //ingredients.append(ingredient)
   // }
}




