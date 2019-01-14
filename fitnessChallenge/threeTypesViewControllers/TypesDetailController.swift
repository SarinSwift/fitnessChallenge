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
    
    var challengesArray: [Challenges] = [Challenges(challenge1: "10 squats", challenge2: "Drink more than 6 cups of water", idChallenge1: 1, idChallenge2: 2, ifChallenge1Done: false, ifChallenge2Done: false),
                                         Challenges(challenge1: "20 crunches", challenge2: "Use the stairs", idChallenge1: 3, idChallenge2: 4, ifChallenge1Done: false, ifChallenge2Done: false),
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
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: daysCellId, for: indexPath) as! ThirtyDaysCell
        cell.dayLabel.text = "Day \(indexPath.row+1)"
        
        
//        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "selectedDay")
        
//        let selectedDay = daysArray[indexPath.row]
        //Get the object correponding to the day
    
//        uncomment!!
//        showDailyChallenges(selectedDay: selectedDay)
        
        // TESTINGGGGGG
        let dailyChallengesVC = DailyChallengeTest()
        dailyChallengesVC.challengeLabel1.text = challengesArray[indexPath.row].challenge1
        dailyChallengesVC.challengeLabel2.text = challengesArray[indexPath.row].challenge2
        
        if challengesArray[indexPath.row].ifChallenge1Done == true {
            dailyChallengesVC.markButton1.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
            dailyChallengesVC.markButton1.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
            dailyChallengesVC.markButton1.setTitle("Completed!", for: .normal)
            dailyChallengesVC.markButton1.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            dailyChallengesVC.markButton1.isEnabled = false
        }
        if challengesArray[indexPath.row].ifChallenge2Done == true {
            dailyChallengesVC.markButton2.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
            dailyChallengesVC.markButton2.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
            dailyChallengesVC.markButton2.setTitle("Completed!", for: .normal)
            dailyChallengesVC.markButton2.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            dailyChallengesVC.markButton2.isEnabled = false
        }
        
        navigationController?.pushViewController(dailyChallengesVC, animated: true)
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
