//
//  Expense+CoreDataProperties.swift
//  Billy Goat
//
//  Created by Hussle on 4/12/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var amount: Double
    @NSManaged public var companyName: String?
    @NSManaged public var dueDate: NSDate?
    @NSManaged public var isReoccuring: Bool
    @NSManaged public var name: String?

}
