//
//  pantrifyDetailViewController.swift
//  Pantrify
//
//  Created by Harrison Kinbacher on 1/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import UIKit
import AudioToolbox


class pantrifyDetailViewController: UIViewController {

    
    //outlets from master view
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeIngredients: UITextView!
    @IBOutlet weak var recipeMethod: UITextView!
    
    @IBOutlet weak var textViewHc: NSLayoutConstraint!
    @IBOutlet weak var textViewHc2: NSLayoutConstraint!
    
    
    @IBAction func addIngredBtn(_ sender: Any) {
        
        //print(chosenRecipe!.ingredients)
        //Add new ShoppingListItems from the ingredients.
        
        // Converting ingredients into a string
        guard let displayedIngredients = chosenRecipe?.ingredients.joined(separator: ", ") else {return}
        
        // Message to be displayed in Alert
        var message = "'\(displayedIngredients)' \nwill be added to your Shopping List!"
        
        //Declaring alert function
        let alertController = UIAlertController(title: "Add Ingredients?", message: message, preferredStyle: .alert)
        
        //Adding action to aleret function
        alertController.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { action in
            
            //Adding ingredients to shopping list
            guard let ingredients:[String] = self.chosenRecipe?.ingredients else {return}
            for(index,_) in ingredients.enumerated(){
                
                //Filtering out duplicate ingredients
                if !self.shoppingList.shoppingList.description.contains(ingredients[index]){
                    
                    print("ShoppingListItem added called: \(ingredients[index])")
                    
                    //Adding Ingredients to shoppingList array
                    self.shoppingList.addShoppingListItem(ingredients[index], 1, "uncategorised")
                    
                    //Vibrate function. Provides feedback to user.
                    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                }
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler : { action in print("Cancel tapped")}))
        
        // Displaying Alert
        present (alertController, animated: true)

        
       
    }
    
    
    //declearing the values used for the variables in memory
    var chosenRecipe:(mealName: String, mealMethod:String,image:UIImage?, ingredients:[String])?
    
    
    
    private var shoppingList = ShoppingListManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringIngredients = chosenRecipe?.ingredients.joined(separator: " - ")
        
        // setting values to outlets from master view
        
        recipeImage.image = chosenRecipe?.image
        recipeName.text = chosenRecipe?.mealName
        recipeMethod.text = chosenRecipe?.mealMethod
        recipeIngredients.text = stringIngredients
        
        textViewHc.constant = self.recipeMethod.contentSize.height
        textViewHc2.constant = self.recipeIngredients.contentSize.height
        recipeIngredients.isScrollEnabled = false
        recipeMethod.isScrollEnabled = false
        
        /*
         chosenRecipe = chosenRecipe{
            recipeName.text = chosenRecipe.name
            recipeImage.image = chosenRecipe.image
            recipeMethod.text = chosenRecipe.method
            recipeIngredients.text = stringIngredients;
            
        }
 */
        // Do any additional setup after loading the view.
    }
    
    
//    func showAlert(){
//
//        // Converting ingredients into a string
//        let displayedIngredients = chosenRecipe?.ingredients.joined(separator: ",")
//
//        // Message to be displayed in Action Sheet
//        var message = "\(displayedIngredients) are added to your Shopping List"
//
//        //Declaring alert function
//        let alertController = UIAlertController(title: "Add Ingredients", message: message, preferredStyle: .actionSheet)
//
//        //Adding action to aleret function
//        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in print ("OK button tapped")}))
//
//        // Displaying action sheet
//        present (alertController, animated: true)
//
//    }
//
//    func showActionSheet(){
//
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

/*extension pantrifyDetailViewController:shoppingList{
    
    
    func addToShoppingList(){
        
        print("Is being the delegate")
        
        //Handles the optional unwrapping.
        let ingredients:[String] = chosenRecipe!.ingredients
        
        //print(ingredients)
        
            //See whats in the ingredients array
            for (index,_) in ingredients.enumerated(){
                print("\(ingredients[index])")
            }
        }
    
    
    
}*/

//extension pantrifyDetailViewController : Confirm {
//
//    func display(message: String) {
//
//
//        let alertController = UIAlertController(title: "Add Ingredients", message: message, preferredStyle: .actionSheet)
//
//        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: {(action)-> Void in print ("OK button tapped")})
//
//        alertController.addAction(okButton)
//        self.present(alertController, animated: true, completion: nil)
//    }






//}





