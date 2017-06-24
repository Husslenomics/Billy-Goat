//
//  Expense+CoreDataClass.swift
//  Billy Goat
//
//  Created by Hussle on 4/12/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {

    
    /// Instantiate Expense object
    ///
    /// - Parameters:
    ///   - amount: amount of the expense
    ///   - companyName: company name of the expense
    ///   - dueDate: dude date of the expense
    ///   - name: name of the expense
    ///   - isReoccuring: if the expense is re occuring
    ///   - context: context to be used to insert the expense
    /// - Returns: Fully configured Expense or nil
    @discardableResult
    class func expense(with amount: Double?, companyName: String?, dueDate: Date?, name: String?, isReoccuring: Bool?, in context: NSManagedObjectContext) -> Expense? {
    
        guard let amount = amount, let isReoccuring = isReoccuring else { return nil }
        
        let expense = Expense(context: context)
        
        // Hydrate the expense object
        expense.amount = amount
        expense.companyName = companyName
        expense.dueDate = dueDate as! NSDate
        expense.name = name
        expense.isReoccuring = isReoccuring
        
        return expense
    }
    
    class func expenseFetchRequest() -> NSFetchRequest<Expense> {
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Expense.dueDate), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
    
    class func delete(expense: Expense, in context: NSManagedObjectContext) {
        context.delete(expense)
        
        do {
            try context.save()
        } catch {
            print("Wasn't able to delete \(expense.name)")
        }
    }
}
