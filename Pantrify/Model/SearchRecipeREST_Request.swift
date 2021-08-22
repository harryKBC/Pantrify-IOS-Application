//
//  SearchRecipeRest_Rquest.swift
//  Pantrify
//
//  Created by Meena Ibrahim on 29/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import Foundation

protocol UpdateTable {
    
    func updateUI()
}


class SearchRecipeREST_Request {
    
    // Declaring an array of the type SearchRecipeModel to store all matching recipes
    private var _recipes : [SearchRecipeModel] = []
    
    private var recipesWithIngredients : [SearchRecipeModel] = []
    
    var delegate : UpdateTable?
    
    private let session = URLSession.shared
    
    // URL to search the meal database using ingredients (only returns 3 fields: title, ID, image and no ingredients or method)
    private let base_url: String = "https://www.themealdb.com/api/json/v2/9973533/filter.php?"
    
    
    //Url to search the meal data base using matching meal IDs (returns all desired 5 fields)
    private let base_url2: String = "https://www.themealdb.com/api/json/v2/9973533/lookup.php?"
    
    //Param to be used to add ingredients to request
    private let paramIngredients: String = "i="
    
    //Param to be used to add ID to request
    private let paramID: String = "i="
    
    
    // Returning matching recipes
    var recipes : [SearchRecipeModel]{
        return _recipes
    }
    
    //Counter for network requests
    private var counter: Int = 0
    
    
    
    // Providing search url using pantry ingredients
    func getRecipe(withIngredients: String){
        _recipes = []
        
        // Adding pantry ingredients to the search URL
        let url = base_url + paramIngredients + withIngredients
        
        
        
        // Filtering out empty spaces
        guard let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            else {
                return
        }
        
        if let url = URL(string : escapedAddress){
            
            let request = URLRequest (url:url)
            
            //Calling on getData to send request to REST site
            getData(request, element: "meals")
        }
        
    }
    
    // Researching using matching recipes IDs to get a more detailed result from the REST site
    func getRecipe2(withID: String){
        _recipes = []
        
        
        // Adding ID to the URL
        let url2 = base_url2 + paramID + withID
        
        
        
        // Filtering out empty spaces
        guard let escapedAddress2 = url2.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            else {
                return
        }
        
        if let url2 = URL(string : escapedAddress2){
            
            let request2 = URLRequest (url:url2)
        
            
            //Calling the method to send the request using ID
            getDataID(request2, element: "meals")
        }
        
    }
    
    //requesting Data (first request using ingredients from pantry to get matching recipes)
    private func getData (_ request: URLRequest, element : String){
        let task = session.dataTask(with: request, completionHandler: {
            
            data, response, downloadError in
            
            if let error = downloadError{
                
                // Returning error
                print(error)
                
            }
            else{
                var parsedResult : Any! = nil
                
                do{
                    
                    parsedResult = try JSONSerialization.jsonObject (with: data! , options: JSONSerialization.ReadingOptions.allowFragments)
                }catch{print()}
                
                
                let result = parsedResult as! [String: Any]
                
                
                
                if let returnedRecipes = result["meals"] as? [[String : Any]]{
                
               let allRecipes = returnedRecipes
                
                
                
                    
                    
                
                // Going through the request results to extract the matching recipes IDs
                    
                // Ensuring no crash if result is empty (i.e no matching meals found)
                if allRecipes.count > 0 {
                    
                     self.counter = 0
                    
                    // Going through the matching recipes array
                        for r in allRecipes {
                         
                        // Limiting the amount of network requests (20 recipes) to help reduce lag
                        if self.counter < 20 {
                        let title = r["strMeal"] as! String
                        let imageURL = r["strMealThumb"] as! String
                        let ID = r["idMeal"] as! String
                        let mealMethod = ""
                        let ingredients : [String] = []
                        
                       
                        
                            let recipe = SearchRecipeModel (title: title, imageURL : imageURL, ID : ID, mealMethod : mealMethod, ingredients : ingredients)
                        
                        
                            //self._recipes.append(recipe)
                            self.getRecipe2(withID: recipe.ID)
                            
                         }
                       
                        self.counter += 1
                        
                        
                    }
                }
                    
                
//                DispatchQueue.main.async {
//                    self.delegate?.updateUI()
//                }
            }
            }
        })
        
        task.resume()
        
    }
    
    // Requesting data (second request using matching recipes IDs)
    private func getDataID (_ request: URLRequest, element : String){
        
        
        let task = session.dataTask(with: request, completionHandler: {
            
            data, response, downloadError in
            
            if let error = downloadError{
                
                // Returning error
                print(error)
                
            }
            else{
                var parsedResult : Any! = nil
                
                do{
                    
                    parsedResult = try JSONSerialization.jsonObject (with: data! , options: JSONSerialization.ReadingOptions.allowFragments)
                }catch{print()}
                
                let result = parsedResult as! [String: Any]
                
               
                
                let allRecipes = result["meals"] as! [[String : Any]]
                
                
                
                if allRecipes.count > 0 {
                    for r in allRecipes {
                        
                        let title = r["strMeal"] as! String
                        let imageURL = r["strMealThumb"] as! String
                        let ID = r["idMeal"] as! String
                        let mealMethod = r["strInstructions"] as! String
                        var ingredients = [String] ()
                        
                        // Elemenating empty spots from the parsed ingredients array (Site reserves 20 places for ingredients by default, while ingredients are usually less which leaves empty spots)
                        for i in r{
                            if(i.key == "strIngredient1" || i.key == "strIngredient2" || i.key == "strIngredient3" || i.key == "strIngredient4" || i.key == "strIngredient5" || i.key == "strIngredient6" || i.key == "strIngredient7" || i.key == "strIngredient8" || i.key == "strIngredient9" || i.key == "strIngredient10" || i.key == "strIngredient11" || i.key == "strIngredient12" || i.key == "strIngredient13" || i.key == "strIngredient14" || i.key == "strIngredient15" || i.key == "strIngredient16" || i.key == "strIngredient17" || i.key == "strIngredient18" || i.key == "strIngredient19" || i.key == "strIngredient20"){
                                if(i.value is String){
                                    if((i.value as! String) != ""){
                                        ingredients.append(i.value as! String)
                                    }
                                    
                                }
                                
                                
                            }
                            
                        }

                        // Creating a recipe with all the parsed details
                        let recipe = SearchRecipeModel (title: title, imageURL : imageURL, ID : ID, mealMethod: mealMethod, ingredients: ingredients)
                        
                        // Adding the recipes to the array
                        self._recipes.append(recipe)
                       
                        
                        
                    }
                }
                DispatchQueue.main.async {
                    self.delegate?.updateUI()
                }
            }
        })

        task.resume()
        
    }
  
    private init() {
        
    }
    static let shared = SearchRecipeREST_Request ()
}
