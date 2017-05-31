//
//  Income+CoreDataClass.swift
//  Billy Goat
//
//  Created by Hussle on 4/12/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import CoreData

@objc(Income)
public class Income: NSManagedObject {
    
    
//    creating a class function to be called wherever specifically at done button
    class func income(with amount: Double?, sourceName: String?, name: String?, date: Date?, isReoccuring: Bool?, in context: NSManagedObjectContext) -> Income? {
        
        guard let amount = amount, let isReoccuring = isReoccuring else { return nil }
        
        let income = Income(context: context)
        
        income.amount = amount
        income.sourceName = sourceName
        income.name = name
        income.date = date as! NSDate
        income.isReoccuring = isReoccuring
        
        return income
    }

    
    class func incomeFetchRequest() -> NSFetchRequest<Income> {
        let fetchRequest: NSFetchRequest<Income> = Income.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Income.date), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
    
    class func delete(income: Income, in context: NSManagedObjectContext) {
        context.delete(income)
        
        do {
            try context.save()
        } catch {
            print("was unable to save \(income.name) ")
        }
    }
}
