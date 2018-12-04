//
//  Challenges.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/18/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation

struct Challenges: Codable {
    var challenge1: String
    var challenge2: String
    var idChallenge1: Int
    var idChallenge2: Int
    // ifChallenge1Done: Bool
    // ifChallenge2DOne: Bool
    
    public var lastCompletionDate: Date?

    public var hasCompletedForToday: Bool? {
        return lastCompletionDate?.isToday ?? false
    }
    
}

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
    
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    var isYesterday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInYesterday(self)
    }
}
