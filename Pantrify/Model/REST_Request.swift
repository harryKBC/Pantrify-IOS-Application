//
//  REST_Request.swift
//  Pantrify
//
//  Created by Harrison Kinbacher on 23/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import Foundation

//function which will reload the UI displaying new pulled data
protocol Refresh{
    func refreshUI()
}

class Request{
    
    var counter:Int
    
    
    init(){
        counter = 1
        
    }
    
    //array of respoances
    var recievedRecipes = [RecipeAPI]()
    
    var delegate:Refresh?
    
    //multiple network resources
    let session = URLSession.shared
    private let baseURL = URL(string: "https://www.themealdb.com/api/json/v2/9973533/random.php")
    
    func refresh(){
        self.delegate?.refreshUI()
    }
    
    //function created which is used to reset the array to nil
    func setToNull(){
        recievedRecipes = []
    }
   
    //function used to call the API
     func recipePull(){
        dataFromPull(pullRequest: baseURL!)
    }
    
    //function which calls the api and sorts the pulled data
     func dataFromPull(pullRequest:URL){
        if(counter <= 15){
            
        //prepearing the api and handeling the pull result.
        let task = session.dataTask(with: pullRequest,completionHandler:{data, response, downloadError in
            
            if let error = downloadError{
                print(error)
            }
            else{
                var pullResult:Any! = nil
                do{
                     pullResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }catch{print()}
                let result = pullResult as! [String:Any]
                let allRecipe = result["meals"] as! [[String:Any]]
                
                //for loop that sorts the pulled Json data
                for n in allRecipe{
                    var checker = false;
                    //adding recipe detains to variables
                    let recipeName = n["strMeal"] as! String
                    
                    for y in self.recievedRecipes{
                        if(y.recipeTitle == recipeName){
                             checker = true
                        }
                    }
                    
                    
                    let recipeMethod = n["strInstructions"] as! String
                    let recipeThumb = n["strMealThumb"] as! String
                    var recipeIngredents = [String]()
                    for i in n{
                        
                        //if statement used to sort though the 20 ingredents that every single pull gives us back. If they contain no data they will not be added to the ingredents array.
                        if(i.key == "strIngredient1" || i.key == "strIngredient2" || i.key == "strIngredient3" || i.key == "strIngredient4" || i.key == "strIngredient5" || i.key == "strIngredient6" || i.key == "strIngredient7" || i.key == "strIngredient8" || i.key == "strIngredient9" || i.key == "strIngredient10" || i.key == "strIngredient11" || i.key == "strIngredient12" || i.key == "strIngredient13" || i.key == "strIngredient14" || i.key == "strIngredient15" || i.key == "strIngredient16" || i.key == "strIngredient17" || i.key == "strIngredient18" || i.key == "strIngredient19" || i.key == "strIngredient20"){
                            if(i.value is String){
                                if((i.value as! String) != ""){
                                    recipeIngredents.append(i.value as! String)
                                }
                            }
                        }
                    }
                    
                    //creating the struct recipe item to be added to the array from the pulled data
                    let recipe = RecipeAPI(method: recipeMethod, recipeImageURL: recipeThumb, recipeTitle: recipeName, ingredients: recipeIngredents)
                    
                    //adding the sorted data to the array
                    if(checker == false){
                        self.recievedRecipes.append(recipe)
                    }
                }
                
               //refreshing the UI allowing the new data to be displayed
                
                //self.delegate?.refreshUI()
                if(self.counter == 10){
                    self.delegate?.refreshUI()
                }
                self.counter = self.counter + 1
            }
            
        })
        task.resume()
        
    }
    }
    
}
