//
//  ShoppingListItem+CoreDataProperties.swift
//  Pantrify
//
//  Created by Julian Rich on 27/10/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//
//

import Foundation
import CoreData


extension ShoppingListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingListItem> {
        return NSFetchRequest<ShoppingListItem>(entityName: "ShoppingListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int16
    @NSManaged public var category: String?

}
