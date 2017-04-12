//
//  Income+CoreDataProperties.swift
//  Billy Goat
//
//  Created by Hussle on 4/12/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import CoreData


extension Income {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Income> {
        return NSFetchRequest<Income>(entityName: "Income")
    }

    @NSManaged public var amount: Double
    @NSManaged public var date: NSDate?
    @NSManaged public var isReoccuring: Bool
    @NSManaged public var name: String?
    @NSManaged public var sourceName: String?

}
