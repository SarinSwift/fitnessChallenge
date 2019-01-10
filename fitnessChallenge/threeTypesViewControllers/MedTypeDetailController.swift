//
//  MedTypeDetailController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 12/21/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class MedTypeDetailController: TypesDetailController {
    
//    let myTableview: UITableView = {
//        let tv = UITableView()
//        tv.contentMode = .scaleAspectFill
//        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        tv.translatesAutoresizingMaskIntoConstraints = false
//        tv.separatorColor = UIColor.white
//        return tv
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
//
//        setupNavBar()
//        setupTableView()
//    }
//
//    func setupNavBar() {
//        navigationItem.title = "Fitness"
//    }
//
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
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 30
//    }
//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medCellId", for: indexPath) as! MedThirtyDayCell
        cell.dayLabel.text = daysArray[indexPath.item].dayNumber
        return cell
    }
}

class MedThirtyDayCell: UITableViewCell {
    
    // creating the view
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.3921568627, blue: 0.3921568627, alpha: 0.95)
        
        
        view.layer.cornerRadius = 10
        
        // these shadows aren't working!!!
        view.layer.masksToBounds = true
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.3
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: 60, height: 60)).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Day 1"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    
    func setupView() {
        
        addSubview(cellView)
        cellView.addSubview(dayLabel)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        self.selectionStyle = .none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
