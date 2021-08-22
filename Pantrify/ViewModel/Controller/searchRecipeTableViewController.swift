//
//  searchRecipeTableViewController.swift
//  Pantrify
//
//  Created by Meena Ibrahim on 1/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import UIKit


// Creating a table view controller
class searchRecipeTableViewController: UITableViewController , UpdateTable {

    
    
    
    
    //Connecting to viewModel file
    var viewModel = searchRecipeViewModel()

    //Spinner outlet
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    //Refresh meals button outlet
    @IBAction func RefreshMeals(_ sender: Any) {
        
        //Reloading Table View
        viewDidLoad()
        tableView.reloadData()
    }
    
    
    // Determining how many cells in the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
     return viewModel.count
        
        
        
    }
    
    // Populating table cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)


      
       let imageView = cell.viewWithTag(1000) as? UIImageView
       let mealName = cell.viewWithTag(1001) as? UILabel
       let ingredients = cell.viewWithTag(1002) as? UILabel
    
        
       
        
        if let imageView = imageView, let  mealName = mealName, let ingredients = ingredients {
            
            
         
            imageView.image = viewModel.getImageFor(index: indexPath.row)
            mealName.text = viewModel.getTitleFor(index: indexPath.row)
            ingredients.text = viewModel.getIngredientsAsStringFor(index: indexPath.row)
            
            
        }
 
        //Stoping spinner action
        self.loading.stopAnimating()
        
        //Returning Cell
        return cell
        
    }
    
    // Updating table View
    func updateUI() {
        tableView.reloadData()
    }

    // Constructor
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getRecipe()
        self.loading.startAnimating()
        
        tableView.dataSource = self
        viewModel.delegate = self
        
        self.loading.hidesWhenStopped = true;
    }
    

    // Sending selected meal details to the recipe detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell, let indexPath = self.tableView?.indexPath(for: cell) else{return}
        
        if let destination = segue.destination as? pantrifyDetailViewController{
            let chosenRecipe = viewModel.getMeal(byIndex: indexPath.row)
            
            destination.chosenRecipe = chosenRecipe
        }
        
    }
    
}

