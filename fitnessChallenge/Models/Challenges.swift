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
    var ifChallenge1Done: Bool
    var ifChallenge2Done: Bool
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
