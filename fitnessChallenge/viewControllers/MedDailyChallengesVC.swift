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
        
//        let selectedDay = UserDefaults.standard.value(forKey: "selectedDay") as! Int
//        if indexPath.row == 0 {
//            cell.challenge1Label.text = medChallengesArray[selectedDay].challenge1
//            cell.challenge1 = challengesArray[selectedDay].idChallenge1
//
//            return cell
//        } else if indexPath.row == 1 {
//            cell.challenge1Label.text = medChallengesArray[selectedDay].challenge2
//            return cell
//        }
        
        return cell
    }
}

class MedChallengesCell: ChallengesCell {
    
}
