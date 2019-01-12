//
//  PersistenceLayer.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 11/18/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation

struct PersistenceLayer {
    private(set) var challenges = [Challenges]()
    private static let userDefaultsChallengesKeyValue = "CHALLENGES_ARRAY"
    
    init() {
        self.loadChallenges()
    }
    
    // load challenges
    private mutating func loadChallenges() {
        let userDefaults = UserDefaults.standard
        // instantiate our user defaults
        // grab the array of challengesfrom our userDefaults for the key we made earlier
        guard let challengeData = userDefaults.data(forKey: PersistenceLayer.userDefaultsChallengesKeyValue),
            let challenges = try? JSONDecoder().decode([Challenges].self, from: challengeData) else {
                return
        }
        
        self.challenges = challenges
    }
    
    // saving challenges
    private func saveChallenges() {
        guard let challengesData = try? JSONEncoder().encode(self.challenges) else {
            fatalError("could not encode list of challenges")
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(challengesData, forKey: PersistenceLayer.userDefaultsChallengesKeyValue)
    }
    
//    mutating func markChallengeAsComplete(_ challengeIndex: Int) -> Challenges {
//        var updatedChallenge = self.challenges[challengeIndex]
        
//        guard updatedChallenge.hasCompletedForToday == false else { return updatedChallenge }
//
//        let now = Date()
//        updatedChallenge.lastCompletionDate = now
        
//        self.challenges[challengeIndex] = updatedChallenge
//        self.saveChallenges()
//
//        return updatedChallenge
//    }
    
}
