//
//  SLViewController.swift
//  Pantrify
//
//  Created by Julian Rich on 5/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import UIKit
import AudioToolbox

//UIViewController-------------------------------------------
class SLViewController: UIViewController {
    

    //View Model
    var viewModel = AddSLItemViewModel()
    
    
    @IBOutlet weak var addItemLabel: UILabel!
    
    @IBOutlet weak var addItemTextField: UITextField!
    
    @IBOutlet weak var SLTableView: UITableView!
    
    @IBOutlet weak var addItemBtn: UIButton!
    
   
    @IBAction func resetListBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "Reset list?", message: "All items will be removed if you continue.", preferredStyle: .alert)
        
        //NEEDS TESTING
        alert.addAction(UIAlertAction(title: "Reset list", style: .destructive, handler:{action in self.viewModel.getShoppingListManager().clearShoppingList()}))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
    @IBAction func addNewItem(_ sender: Any) {
    
        
        
        
        
        //If textField is empty, return
        guard let userText = addItemTextField.text, userText.isEmpty == false else{
            
            //Displays alert that item is missing name.
            let alert = UIAlertController(title: "Missing Item Name", message: "All items must have a name.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }
        

        
        
        //CoreData viewModel
        viewModel.addShoppingListItem(userText, 1, "uncategorised")
        
        //Reloads the tableView to show changes.
        SLTableView.reloadData()
        
        //Vibrates the phone
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SLTableView.dataSource = self
        //Makes SLViewController the delegate of the RefreshTable protocol.
        //This is how it knows which scene to refresh.
        viewModel.getShoppingListManager().delegate = self
        
        //Change some properties on textfield for appearance.
        addItemTextField.layer.cornerRadius = 5.0
        addItemTextField.layer.borderWidth = 5.0
        let myColor : UIColor = UIColor.lightGray
        addItemTextField.layer.borderColor = myColor.cgColor
        
        //Changes some attributes of the add item button.
        addItemBtn.layer.cornerRadius = 5.0
    }
    
    
    
}
    
    

//Extension for the embedded tableView-----------------------------------------------
extension SLViewController:UITableViewDataSource, UITextFieldDelegate, ChangeQty, RefreshTable{
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.getListCount()
        
    }
    
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as! SLTableViewCell
        
        
        //This variable uses the row number of the table( they start at 0) to access this member of the collection and store it in currentMeal.******
        //let currentShoppingItem = viewModel.getShoppingListItems(byIndex: indexPath.row)
        
        //CoreData fetching of shoppingListItem
        let currentShoppingItem = viewModel.getShoppingListItem(byIndex: indexPath.row)
        
        
        //Make the SLViewController the delegate.
        cell.delegate = self
        
        //Set the cellNumber to the row number of the cell.
        cell.cellNumber = indexPath.row
        
        //Changes the cell objects properties to display them on the scene
        cell.itemName.text = currentShoppingItem.name
        cell.itemQty.text = String(currentShoppingItem.quantity)
        
        
        //Returns the cell with all the properties in it above.
        return cell
        
    }
    
    
    // Override to support editing the table view.
    // Adds deletable rows to tableView.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // Delete the row from the data source
            print("About to delete\(viewModel.getShoppingListItem(byIndex: indexPath.item))")
            viewModel.removeListItem(index:indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            SLTableView.reloadData()
            
        } /*else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }*/
    }
    
    
    func decrementQty(cellNumber:Int) {
        viewModel.decreaseQty(index:cellNumber)
        SLTableView.reloadData()
    }
    
    
    func incrementQty(cellNumber:Int) {
        viewModel.increaseQty(index: cellNumber)
        SLTableView.reloadData()
    }
    
    
    //KEYBOARD FUNCTIONALITY-----------------------------------------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addItemTextField.resignFirstResponder()
        return true
    }
    //---------------------------------------------------------------------
    
    override func viewDidAppear(_ animated: Bool) {
        SLTableView.reloadData()
    }
    
    func refreshTable() {
        SLTableView.reloadData()
        print("Delegation of SLTableView.reloadData() completed")

    }
    

}


