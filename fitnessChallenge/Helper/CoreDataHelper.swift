//
//  CoreDataHelper.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/8/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit
import CoreData


// CoreData Stack: create / save / delete / and retrieve
class CoreDataHelper {
    
    static let context: NSManagedObjectContext = {
        // start using the coredata to be set up during runtime
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        // only save things in here if there are alters in the entity
        let persistentContainer = appDelegate.persistentContainer
        // viewContext is mainly for UI changes but there's also backgroundContext which is mainly bigger data saved and the user doesn't see it
        let context = persistentContainer.viewContext
        return context
    }()
    
    static func newChallenge() -> Challenge {
        // inserting the new object into coredata
        let challenge = NSEntityDescription.insertNewObject(forEntityName: "Challenge", into: context) as! Challenge
        return challenge
    }
    
    static func saveChallenge() {
        do {
            try context.save()
        } catch let error {
            print("could not save \(error.localizedDescription)")
        }
    }
    
    static func deleteChallenge(challenge: Challenge) {
        // go through the viewContext route and delete from persistent store!
        context.delete(challenge)
        saveChallenge()
    }
    
    static func retrieveChallenge() -> [Challenge] {
        // create a NSFetchRequest to retrieve all Challenge objects
        let fetchRequest = NSFetchRequest<Challenge>(entityName: "Challenge")
        
        // use the NSManagedObjectContext to execute the NSFetchRequest
        do {
            let results = try context.fetch(fetchRequest)
            print(results)
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            return []
        }
    }
    
    
//    private func fetchRecordsForEntity(_ entity: String, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> [NSManagedObject] {
//        // create fetch request
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
//        var result = [NSManagedObject]()
//
//        do {
//            // execute fetch request
//            let records = try managedObjectContext.fetch(fetchRequest)
//            if let records = records as? [NSManagedObject] {
//                result = records
//            }
//        } catch {
//            print("Unable to fetch managed objects for entity \(entity).")
//        }
//
//        return result
//    }
    
}
