//
//  TypesDetailController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/16/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//


// First card
// ViewController for the 30 day table view cells

import UIKit


class TypesDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var daysArrayTest : [Challenges]!
    let myTableview: UITableView = {
        let tv = UITableView()
        tv.contentMode = .scaleAspectFill
        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    
    let daysCellId = "daysCellId"
    
    let daysArray = [Days(dayNumber: "Day 1"),
                     Days(dayNumber: "Day 2"),
                     Days(dayNumber: "Day 3"),
                     Days(dayNumber: "Day 4"),
                     Days(dayNumber: "Day 5"),
                     Days(dayNumber: "Day 6"),
                     Days(dayNumber: "Day 7"),
                     Days(dayNumber: "Day 8"),
                     Days(dayNumber: "Day 9"),
                     Days(dayNumber: "Day 10"),
                     Days(dayNumber: "Day 11"),
                     Days(dayNumber: "Day 12"),
                     Days(dayNumber: "Day 13"),
                     Days(dayNumber: "Day 14"),
                     Days(dayNumber: "Day 15"),
                     Days(dayNumber: "Day 16"),
                     Days(dayNumber: "Day 17"),
                     Days(dayNumber: "Day 18"),
                     Days(dayNumber: "Day 19"),
                     Days(dayNumber: "Day 20"),
                     Days(dayNumber: "Day 21"),
                     Days(dayNumber: "Day 22"),
                     Days(dayNumber: "Day 23"),
                     Days(dayNumber: "Day 24"),
                     Days(dayNumber: "Day 25"),
                     Days(dayNumber: "Day 26"),
                     Days(dayNumber: "Day 27"),
                     Days(dayNumber: "Day 28"),
                     Days(dayNumber: "Day 29"),
                     Days(dayNumber: "Day 30"),
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Fitness"
    }
    
    func setupTableView() {
        myTableview.delegate = self
        myTableview.dataSource = self
        
        myTableview.register(ThirtyDaysCell.self, forCellReuseIdentifier: daysCellId)
        
        view.addSubview(myTableview)
        
        NSLayoutConstraint.activate([
            myTableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            myTableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            myTableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myTableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
        
        
    }
    
    // shows the single day challenges :)
    func showDailyChallenges() {
        let dailyChallengesVC = DailyChallengesViewController()
        navigationController?.pushViewController(dailyChallengesVC, animated: true)
    }

//    func showDailyChallenges(selectedDay: Challenges) {
//        let dailyChallengesVC = DailyChallengesViewController()
//        dailyChallengesVC.dailyChallenge = selectedDay
//        navigationController?.pushViewController(dailyChallengesVC, animated: true)
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: daysCellId, for: indexPath) as! ThirtyDaysCell
        cell.dayLabel.text = daysArray[indexPath.item].dayNumber
//        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "selectedDay")
        
        let selectedDay = daysArray[indexPath.row]
        //Get the object correponding to the day
    
//        uncomment!!
//        showDailyChallenges(selectedDay: selectedDay)
        showDailyChallenges()
    }
    
}


class ThirtyDaysCell: UITableViewCell {
    
    // creating the view
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.3921568627, blue: 0.3921568627, alpha: 0.89)
        
        
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
