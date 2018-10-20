//
//  DailyChallengesViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/18/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit

class DailyChallengesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let challenesCellId = "challengesCellId"
    
    let challengesArray = [Challenges(challenge1: "10 squats", challenge2: "Drink more than 6 cups of water"),
                           Challenges(challenge1: "20 crunches", challenge2: "Use the stairs"),
                           Challenges(challenge1: "20 lunges", challenge2: "Eat 1 apple"),
                           Challenges(challenge1: "1 minute plank", challenge2: "Think positively!"),
                           Challenges(challenge1: "10 pushups", challenge2: "Organize your room"),
                           Challenges(challenge1: "20 leg raises", challenge2: "Compliment someone"),
                           Challenges(challenge1: "20 situps", challenge2: "Play relaxing music"),
                           Challenges(challenge1: "10 burpees", challenge2: "Think about 5 things you're grateful for"),
                           Challenges(challenge1: "40 bicycle crunches", challenge2: "Find a positive quote"),
                           Challenges(challenge1: "Go for a walk", challenge2: "Go to bed early"),
                           Challenges(challenge1: "No sweets today", challenge2: "Write in a diary"),
                           Challenges(challenge1: "20 lunges", challenge2: "Have a healthy breakfast"),
                           Challenges(challenge1: "20 situps", challenge2: "Read your favorite quote"),
                           Challenges(challenge1: "10 pushups", challenge2: "No ice cream"),
                           Challenges(challenge1: "20 leg lifts", challenge2: "Plan your meals"),
                           Challenges(challenge1: "30 second side planks", challenge2: "Try new fruits!"),
                           Challenges(challenge1: "20 sumo squats", challenge2: "No refined sugar in the morning"),
                           Challenges(challenge1: "15 tricep dips", challenge2: "Have a vegan lunch"),
                           Challenges(challenge1: "50 high knees", challenge2: "Replace unhealthy snacks with fruit"),
                           Challenges(challenge1: "10 burpees", challenge2: "Think about one thankful thing"),
                           Challenges(challenge1: "1 minute walk down plank", challenge2: "Try a new restaurant"),
                           Challenges(challenge1: "15 jump squats", challenge2: "Cook dinner with someone you love"),
                           Challenges(challenge1: "exercise for 10 minutes", challenge2: "read a book"),
                           Challenges(challenge1: "25 narrow squats", challenge2: "Do 1 chore"),
                           Challenges(challenge1: "1 minute plank shoulder taps", challenge2: "Tell your parents you love them!"),
                           Challenges(challenge1: "30 side lunges", challenge2: "Take a picture of you smiling"),
                           Challenges(challenge1: "16 commandos", challenge2: "play sports with friends"),
                           Challenges(challenge1: "2 minute scissor kicks", challenge2: "Have a game night"),
                           Challenges(challenge1: "30 reverse lunges", challenge2: "Hangout with your siblings")
    ]
    
    let myTableview: UITableView = {
        let tv = UITableView()
        tv.contentMode = .scaleAspectFill
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       
    }
    func setupNavBar() {
        navigationItem.title = "Challenges"
    }
    func setupTableView() {
        myTableview.delegate = self
        myTableview.dataSource = self
        
        //Makes it so users can't press on the tableviewcell
        myTableview.isScrollEnabled = false
        
        myTableview.register(ChallengesCell.self, forCellReuseIdentifier: challenesCellId)
        
        view.addSubview(myTableview)
        NSLayoutConstraint.activate([
            myTableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130),
            myTableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            myTableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myTableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavBar()
        setupTableView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: challenesCellId, for: indexPath) as! ChallengesCell
       
        let selectedDay = UserDefaults.standard.value(forKey: "selectedDay") as! Int
        
        if indexPath.row == 0 {
            cell.challenge1Label.text = challengesArray[selectedDay].challenge1
            print(indexPath.item)
            return cell
        }
        else if indexPath.row == 1{
            cell.challenge1Label.text = challengesArray[selectedDay].challenge2
            print(indexPath.item)
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 3
    }
    
}

class ChallengesCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9342781305, green: 0.3532425165, blue: 0.3764705882, alpha: 0.89)
        
        view.layer.cornerRadius = 10
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let challenge1Label: UILabel = {
        let label = UILabel()
        label.text = "10000 squatss :)"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        return label
    }()
    
    let markButton: UIButton = {
        let button = UIButton()
        button.setTitle("Completed", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return button
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(challenge1Label)
        cellView.addSubview(markButton)
        
        challenge1Label.translatesAutoresizingMaskIntoConstraints = false
        challenge1Label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        challenge1Label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        challenge1Label.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        challenge1Label.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        markButton.translatesAutoresizingMaskIntoConstraints = false
        markButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        markButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        markButton.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -20).isActive = true
        markButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        markButton.isEnabled = true
        markButton.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        
    }
    
    @objc func buttonClicked(_ : UIButton) {
        markButton.backgroundColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
        markButton.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
        markButton.setTitle("Completed!", for: .normal)
        markButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}









