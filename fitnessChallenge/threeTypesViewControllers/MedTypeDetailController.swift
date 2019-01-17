//
//  MedTypeDetailController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 12/21/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

// Second card
// ViewController for the 30 day table view cells

class MedTypeDetailController: TypesDetailController {
    
    let medChallengesArray: [Challenges] = [Challenges(challenge1: "20 forward lunges", challenge2: "20 crunchs", idChallenge1: 1, idChallenge2: 2, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "20 scissor kicks", challenge2: "20 side lunges", idChallenge1: 3, idChallenge2: 4, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "20 squats", challenge2: "Eat 1 apple", idChallenge1: 5, idChallenge2: 6, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "go for a 30 minute walk", challenge2: "1 minute plank", idChallenge1: 7, idChallenge2: 8, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "1 minute plank to shoulder tap", challenge2: "get atleast 7 hours of sleep", idChallenge1: 9, idChallenge2: 10, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "40 leg raises", challenge2: "Don't eat anything sweet", idChallenge1: 11, idChallenge2: 12, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "Do yoga", challenge2: "20 lateral raises w/ weights", idChallenge1: 13, idChallenge2: 14, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "7 minute workout on youtube", challenge2: "No coffee", idChallenge1: 15, idChallenge2: 16, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "35 pushups", challenge2: "No alcohol", idChallenge1: 17, idChallenge2: 18, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "Go for a walk", challenge2: "Only drink water", idChallenge1: 19, idChallenge2: 20, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "Meditate for 5 minutes", challenge2: "2 minute plank", idChallenge1: 21, idChallenge2: 22, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "50 pushups", challenge2: "Go for 30 minute walk", idChallenge1: 23, idChallenge2: 24, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "40 russian twists", challenge2: "No sugary foods or beverages", idChallenge1: 25, idChallenge2: 26, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "50 flutter kicks", challenge2: "20 squats", idChallenge1: 27, idChallenge2: 28, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "20 bent over ventral raise", challenge2: "20 minute run", idChallenge1: 29, idChallenge2: 30, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "1 minute side planks", challenge2: "Substitute fruits for snacks", idChallenge1: 31, idChallenge2: 32, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "30 sumo squats", challenge2: "write in your diary", idChallenge1: 33, idChallenge2: 34, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "20 minute body weigth workouts", challenge2: "Don't eat meat", idChallenge1: 35, idChallenge2: 36, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "50 high knees", challenge2: "biceps curls", idChallenge1: 37, idChallenge2: 38, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "20 over head press", challenge2: "20 narrow squats", idChallenge1: 39, idChallenge2: 40, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "2 minute walk down plank", challenge2: "20 bench presses", idChallenge1: 41, idChallenge2: 42, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "15 split squats", challenge2: "2 minute plank", idChallenge1: 43, idChallenge2: 44, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "10 minute pilates", challenge2: "Leg presses", idChallenge1: 45, idChallenge2: 46, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "25 narrow squats", challenge2: "Have 3 servings of vegetables", idChallenge1: 47, idChallenge2: 48, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "2 minute plank shoulder taps", challenge2: "", idChallenge1: 49, idChallenge2: 50, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "30 side lunges", challenge2: "Avoid salt", idChallenge1: 51, idChallenge2: 52, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "16 commandos", challenge2: "Take a cold shower", idChallenge1: 53, idChallenge2: 54, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "20 sumo squat", challenge2: "Don't eat past 7pm", idChallenge1: 55, idChallenge2: 56, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "15 burpees", challenge2: "15 plie squats", idChallenge1: 57, idChallenge2: 58, ifChallenge1Done: false, ifChallenge2Done: false),
                                            Challenges(challenge1: "30 reverse lunges", challenge2: "1 minute superman", idChallenge1: 57, idChallenge2: 58, ifChallenge1Done: false, ifChallenge2Done: false)
    ]

    override func setupTableView() {
        myTableview.delegate = self
        myTableview.dataSource = self
        
        myTableview.register(MedThirtyDayCell.self, forCellReuseIdentifier: "medCellId")
        
        view.addSubview(myTableview)
        
        NSLayoutConstraint.activate([
            myTableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            myTableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            myTableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myTableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
    }
    
    override func showDailyChallenges() {
        let medDailyChallengesvc = MedDailyChallengesVC()
        navigationController?.pushViewController(medDailyChallengesvc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medCellId", for: indexPath) as! MedThirtyDayCell
        cell.dayLabel.text = "Day \(indexPath.row+1)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "selectedDay")
        
        //        let selectedDay = daysArray[indexPath.row]
        //Get the object correponding to the day
        
        //        uncomment!!
        //        showDailyChallenges(selectedDay: selectedDay)
        
        // TESTINGGGGGG
        let dailyChallengesVC = DailyChallengeTest()
        dailyChallengesVC.challengeLabel1.text = medChallengesArray[indexPath.row].challenge1
        dailyChallengesVC.challengeLabel2.text = medChallengesArray[indexPath.row].challenge2
        
        if medChallengesArray[indexPath.row].ifChallenge1Done == true {
            dailyChallengesVC.markButton1.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
            dailyChallengesVC.markButton1.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
            dailyChallengesVC.markButton1.setTitle("Completed!", for: .normal)
            dailyChallengesVC.markButton1.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            dailyChallengesVC.markButton1.isEnabled = false
        }
        if medChallengesArray[indexPath.row].ifChallenge2Done == true {
            dailyChallengesVC.markButton2.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
            dailyChallengesVC.markButton2.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
            dailyChallengesVC.markButton2.setTitle("Completed!", for: .normal)
            dailyChallengesVC.markButton2.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            dailyChallengesVC.markButton2.isEnabled = false
        }
        
        navigationController?.pushViewController(dailyChallengesVC, animated: true)
    }
}

