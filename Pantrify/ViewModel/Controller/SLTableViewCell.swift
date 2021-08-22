//
//  SLTableViewCell.swift
//  Pantrify
//
//  Created by Julian Rich on 8/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import UIKit

//Protocol for delegating to the SLViewController for the corresponding buttons below
protocol ChangeQty{
    
    func decrementQty(cellNumber:Int)
    func incrementQty(cellNumber:Int)
}

//Custom UITableViewCell for simplicity and the use of UIButtons.
class SLTableViewCell: UITableViewCell {
    

    //Makes any class that implements the protocol ChangeQty controllable by this class.
    var delegate:ChangeQty?

    
    //declaration of IBOutlets and variables
    
    var cellNumber:Int?
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemQty: UILabel!
    

    
    //For delegation of decrementing.
    @IBAction func decrementQty(_ sender: Any) {
        
        print("decrement pressed.")
        
        guard let number = cellNumber else{return}

        delegate?.decrementQty(cellNumber: number)
        
    }
    
    //For delegation of incrementing.
    @IBAction func incrementQty(_ sender: Any) {
        
        print("Increment pressed.")
        
        guard let number = cellNumber else{return}
        
        delegate?.incrementQty(cellNumber: number)
        
    }

}
