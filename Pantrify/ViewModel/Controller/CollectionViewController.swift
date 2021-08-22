//
//  CollectionViewController.swift
//  Pantrify
//
//  Created by Harrison Kinbacher on 29/9/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RandomRecipeCell"

class CollectionViewController: UICollectionViewController, Refresh {
    
    @IBOutlet var spinner:UIActivityIndicatorView!
    
    func refreshUI() {
        
        //forcing running refresh UI though the main thred
        DispatchQueue.main.async{
            self.collectionView?.reloadData()
        }
    }
    
   
    //conection to the ViewModel established
    private var randomRecipesViewModelConnection = randomRecipesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner.startAnimating()
        self.spinner.hidesWhenStopped = true;
        
       
        //added some padding to the collection view
        collectionView!.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        randomRecipesViewModelConnection.delegate = self
          DispatchQueue.global(qos: .background).async {
            self.randomRecipesViewModelConnection.getData()
            self.refreshUI()
            
        }
    }
    
    //function that returns the amount of cells that will be displayed
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return randomRecipesViewModelConnection.counter
    }

    //function that displays and populates cells inside the collection view
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //declear and set each cell to the atrabuites associated with the reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        let imageView = cell.viewWithTag(2000) as? UIImageView
        let recipeName = cell.viewWithTag(2001) as? UILabel
        
        if let imageView = imageView, let recipeName = recipeName{
            let displayedRecipe = randomRecipesViewModelConnection.getMeal(arrayIndex: indexPath.item)
            imageView.image = displayedRecipe.image
            recipeName.text = displayedRecipe.mealName
        }
      self.spinner.stopAnimating()
        return cell
    }
    
    //auto generated prepare for segue function use to send the userSelected collectionViewController information to the masterDetailViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let cell = sender as? UICollectionViewCell, let indexPath = self.collectionView?.indexPath(for: cell) else{return}
        
        if let destination = segue.destination as? pantrifyDetailViewController{
            let chosenRecipe = randomRecipesViewModelConnection.getMeal(arrayIndex: indexPath.item)
            
            destination.chosenRecipe = chosenRecipe
            
        }
        
    }


}
