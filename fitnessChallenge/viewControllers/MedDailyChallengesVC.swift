//
//  MedDailyChallengesVC.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/9/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

// Second card
// The viewController that has the 2 tableViewCells

class MedDailyChallengesVC: DailyChallengesViewController {
    
    let medChallengesArray: [Challenges] = [Challenges(challenge1: "MEDium", challenge2: "MEDium", idChallenge1: 1, idChallenge2: 2, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "MEDium", challenge2: "MEDium", idChallenge1: 3, idChallenge2: 4, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "20 lunges", challenge2: "Eat 1 apple", idChallenge1: 5, idChallenge2: 6, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "1 minute plank", challenge2: "30 jumping jacks", idChallenge1: 7, idChallenge2: 8, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "10 pushups", challenge2: "Organize your room", idChallenge1: 9, idChallenge2: 10, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "20 leg raises", challenge2: "1 minute wall sit", idChallenge1: 11, idChallenge2: 12, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "20 situps", challenge2: "30 second side plank each side", idChallenge1: 13, idChallenge2: 14, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "10 burpees", challenge2: "20 lateral raises", idChallenge1: 15, idChallenge2: 16, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "40 bicycle crunches", challenge2: "Have a vegan breakfast", idChallenge1: 17, idChallenge2: 18, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "Go for a walk", challenge2: "Go to bed early", idChallenge1: 19, idChallenge2: 20, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "Go for a 15 minute walk", challenge2: "No candy", idChallenge1: 21, idChallenge2: 22, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "20 lunges", challenge2: "1 minute plank", idChallenge1: 23, idChallenge2: 24, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "20 situps", challenge2: "No sugary foods or beverages", idChallenge1: 25, idChallenge2: 26, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "10 pushups", challenge2: "Make a healthy lunch", idChallenge1: 27, idChallenge2: 28, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "20 leg lifts", challenge2: "No soda or juice", idChallenge1: 29, idChallenge2: 30, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "30 second side planks", challenge2: "Try new fruits!", idChallenge1: 31, idChallenge2: 32, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "20 sumo squats", challenge2: "No refined sugar in the morning", idChallenge1: 33, idChallenge2: 34, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "15 tricep dips", challenge2: "Have a vegan lunch", idChallenge1: 35, idChallenge2: 36, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "50 high knees", challenge2: "Replace unhealthy snacks with fruit", idChallenge1: 37, idChallenge2: 38, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "10 burpees", challenge2: "Limit portion sizes", idChallenge1: 39, idChallenge2: 40, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "1 minute walk down plank", challenge2: "Have 3 servings of vegetables", idChallenge1: 41, idChallenge2: 42, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "15 jump squats", challenge2: "Cook homemade dinner", idChallenge1: 43, idChallenge2: 44, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "Do stretch exercises for 10 minutes", challenge2: "read a book", idChallenge1: 45, idChallenge2: 46, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "25 narrow squats", challenge2: "Do 1 chore", idChallenge1: 47, idChallenge2: 48, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "1 minute plank shoulder taps", challenge2: "1 minute wall squat", idChallenge1: 49, idChallenge2: 50, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "30 side lunges", challenge2: "Get a good night's sleep!", idChallenge1: 51, idChallenge2: 52, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "16 commandos", challenge2: "play sports with friends", idChallenge1: 53, idChallenge2: 54, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "2 minute scissor kicks", challenge2: "Don't snack after dinner", idChallenge1: 55, idChallenge2: 56, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "30 reverse lunges", challenge2: "Have a healthy breakfast", idChallenge1: 57, idChallenge2: 58, ifChallenge1Done: false, ifChallenge2Done: false),
        Challenges(challenge1: "8x8 deadlift", challenge2: "10x5 front squat", idChallenge1: 57, idChallenge2: 58, ifChallenge1Done: false, ifChallenge2Done: false)
    ]
    
    override func setupTableView() {
        myTableview.delegate = self
        myTableview.dataSource = self
        
        //Makes it so users can't press on the tableviewcell
        myTableview.isScrollEnabled = false
        myTableview.allowsSelection = false
        
        myTableview.register(MedChallengesCell.self, forCellReuseIdentifier: "medChallengesCellId")
        
        view.addSubview(myTableview)
        NSLayoutConstraint.activate([
            myTableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130),
            myTableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            myTableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myTableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medChallengesCellId", for: indexPath) as! MedChallengesCell
        
        let selectedDay = UserDefaults.standard.value(forKey: "selectedDay") as! Int
        
        if indexPath.row == 0 {
            cell.challenge1Label.text = medChallengesArray[selectedDay].challenge1
            cell.challenge1 = challengesArray[selectedDay].idChallenge1
            
            return cell
        } else if indexPath.row == 1 {
            cell.challenge1Label.text = medChallengesArray[selectedDay].challenge2
            return cell
        }
        
        return cell
    }
}

class MedChallengesCell: ChallengesCell {
    
}
