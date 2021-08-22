//
//  CPTableViewCellDelegate.swift
//  Pantrify
//
//  Created by Jerry Rousseau on 9/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import UIKit

protocol itemNumber {
    // Create Protocols for the view controller to run fucntions
    func increaseItemNumber(cellNumber: Int)
    func decreaseItemNumber(cellNumber: Int)
}


class CPTableViewCellDelegate: UITableViewCell {

    var cellNumber: Int? 
    // Set a variable to allow the view controller to be a delegate
    var delegate:itemNumber?
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    // Outlet for UILabel displaying number of items
    @IBOutlet weak var itemNumberLabel: UILabel!
    
    // When buttons are selected the functions listed in the protocols will run
    // Action button for increasing the number of items
    @IBAction func increaseItemButton(_ sender: Any) {
        guard let number = cellNumber else {return}
        delegate?.increaseItemNumber(cellNumber: number)
    }
    
    // Action button for decreasing the number of items
    @IBAction func decreaseItemButton(_ sender: Any) {
        guard let number = cellNumber else {return}
        delegate?.decreaseItemNumber(cellNumber: number)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
