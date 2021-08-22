//
//  createPantry.swift
//  Pantrify
//
//  Created by Harrison Kinbacher on 21/9/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
import Foundation
import UIKit
import AudioToolbox

class createPantry: UIViewController, UITextFieldDelegate {
    
//    CoreData
    var viewModel = CreatePantryViewModel()
    
    

    // TEXT FIELD OUTLET
    @IBOutlet weak var addItemText: UITextField!
    
    
    // ADD ITEM BUTTON
    @IBAction func addItembutton(_ sender: Any) {
        
        guard let addItemText = addItemText.text, addItemText.isEmpty == false else {
            return
        }
//       CoreData connection to CreatePantryViewModel file
        viewModel.addNewPantryItem(addItemText, 0)

//        Reloads tableView
        CPTableView.reloadData()

      
    }
    
//    TABLE VIEW OUTLET
    @IBOutlet weak var CPTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addItemText.delegate = self
        CPTableView.dataSource = self
    }
}

extension createPantry: UITableViewDelegate, UITableViewDataSource, itemNumber {
    
    func increaseItemNumber(cellNumber: Int) {
        
        viewModel.increasePantryItem(index: cellNumber)
        CPTableView.reloadData()
    }
    
    func decreaseItemNumber(cellNumber: Int) {
        
        viewModel.decreasePantryitem(index: cellNumber)
        CPTableView.reloadData()
    }
    
    
//    Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return viewModel.
        return viewModel.pantryItemCount()
    }

//    Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CPCell", for: indexPath) as! CPTableViewCellDelegate
        
        cell.delegate = self
        
        // Refernce to row number
        cell.cellNumber = indexPath.row
        
        cell.itemNameLabel.text = viewModel.getPantryItem(byIndex: indexPath.row).itemName
        
        let newPantryItem = viewModel.getPantryItem(byIndex: indexPath.row)
        
//        References to UILabel CPTableViewDelegate file
        cell.itemNumberLabel.text = String(newPantryItem.itemNumber)

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            viewModel.deletePantryItem(index: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            CPTableView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addItemText.resignFirstResponder()
        return true
    }
}
