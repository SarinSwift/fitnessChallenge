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


// CoreData to do: create / save / delete / and retrieve
class CoreDataHelper {
    
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        return context
    }()
    
    static func newChallenge() -> Challenge {
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
        context.delete(challenge)
        saveChallenge()
    }
    
    static func retrieveChallenge() -> [Challenge] {
        do {
            let fetchRequest = NSFetchRequest<Challenge>(entityName: "Challenge")
            let results = try context.fetch(fetchRequest)
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            return []
        }
    }
    
}
