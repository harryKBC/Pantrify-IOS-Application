//
//  PantryItems+CoreDataProperties.swift
//  Pantrify
//
//  Created by Jerry Rousseau on 29/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//
//

import Foundation
import CoreData


extension PantryItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PantryItems> {
        return NSFetchRequest<PantryItems>(entityName: "PantryItems")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var itemNumber: Int16

}
