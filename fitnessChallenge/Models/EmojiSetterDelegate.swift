//
//  EmojiSetterDelegate.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/9/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

// inheriting this delegate in the DailyChallengesViewController.swift to save state of the button to this viewcontroller

protocol EmojiSetterDelegate {
    func setEmoji(emoji: String)
}
