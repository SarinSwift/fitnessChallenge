//
//  DailyChallengesViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/18/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit
import CoreData

//class Persistance {
//    var bodyFitnessChallenge = BodyFitnessChallenge()
//    //..
//}
//
//class BodyFitnessChallenge {
//    var dailyChallenges: [Challenges] = [
//        Challenges(challenge1: "10 squats", challenge2: "Drink more than 6 cups of water", idChallenge1: 1, idChallenge2: 2, ifChallenge1Done: false, ifChallenge2Done: false),
//        Challenges(challenge1: "20 crunches", challenge2: "Use the stairs", idChallenge1: 3, idChallenge2: 4, ifChallenge1Done: false, ifChallenge2Done: false),
//        Challenges(challenge1: "20 lunges", challenge2: "Eat 1 apple", idChallenge1: 5, idChallenge2: 6, ifChallenge1Done: false, ifChallenge2Done: false),
//        Challenges(challenge1: "1 minute plank", challenge2: "30 jumping jacks", idChallenge1: 7, idChallenge2: 8, ifChallenge1Done: false, ifChallenge2Done: false),
//        Challenges(challenge1: "10 pushups", challenge2: "Organize your room", idChallenge1: 9, idChallenge2: 10, ifChallenge1Done: false, ifChallenge2Done: false)
//    ]
//}

// first card
// The viewController that has the 2 tableViewCells

class DailyChallengesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EmojiSetterDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var dailyChallenge: Challenges!
    
    func setEmoji(emoji: String) {
        self.addEmojiButton.setImage(UIImage(named: emoji), for: .normal)
    }
    
    private let challenesCellId = "challengesCellId"
    
    // use for loop instead of this?
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
    
    let myTableview: UITableView = {
        let tv = UITableView()
        tv.contentMode = .scaleAspectFill
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tv
    }()

    let addEmojiButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9333333333, green: 0.3529411765, blue: 0.3764705882, alpha: 0.89), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
        button.layer.cornerRadius = 55
        button.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.3529411765, blue: 0.3764705882, alpha: 0.89)
        button.layer.borderWidth = 3.5
        button.addTarget(self, action: #selector(addEmojiTapped(_ :)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // will bring up the storyboard ChooseEmojiViewController!
    @objc func addEmojiTapped(_ : UIButton) {
        let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let emojiVC = sb.instantiateViewController(withIdentifier: "chooseEmoji") as! ChooseEmojiViewController
        // set the delegate unless it won't set the emoji!!
        emojiVC.delegate = self
        self.navigationController?.pushViewController(emojiVC, animated: true)
    }
    
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
        myTableview.allowsSelection = false
        
        myTableview.register(ChallengesCell.self, forCellReuseIdentifier: challenesCellId)
        
        view.addSubview(myTableview)
        NSLayoutConstraint.activate([
            myTableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130),
            myTableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            myTableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myTableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
    }
    
    func setupButton() {
        view.addSubview(addEmojiButton)
        addEmojiButton.heightAnchor.constraint(equalToConstant: 110).isActive = true
        addEmojiButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        addEmojiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (view.bounds.height / 3) + 20).isActive = true
        addEmojiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavBar()
        setupTableView()
        setupButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "markButtonBGColor") as? UIColor {
            self.view.backgroundColor = x
        }
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
            cell.challenge1 = challengesArray[selectedDay].idChallenge1
            cell.completed = challengesArray[selectedDay].ifChallenge1Done
            return cell
        }
        else if indexPath.row == 1{
            cell.challenge1Label.text = challengesArray[selectedDay].challenge2
            return cell
        }
        
        // 1
        cell.markButton.setTitle("Completed!!!!", for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 3
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: challenesCellId, for: indexPath) as! ChallengesCell
//        
//        if cell.completed == true {
//            cell.markButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
//        } else if cell.completed == false {
//            cell.markButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//        }
//    }
    
}



// first card
// The single cell that has the label and the markButton

class ChallengesCell: UITableViewCell {
    
    var completed = false
//        didSet {
//
//            // setting it to be green based on Boolean value in CoreData
//            if completed == true {
//                markButton.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
//                markButton.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
//                markButton.setTitle("Completed!", for: .normal)
//                markButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
//
//                // These 2 lines make the whole box jump in front
//                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
//                    self.transform = CGAffineTransform.identity
//                }, completion: nil)
//            } else {
//                markButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                markButton.setTitle("Complete", for: .normal)
//                markButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//            }
//        }
//   {
    
    var challenge1: Int = 0
    
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
    
    
    var markButton: UIButton = {
        let button = UIButton()
        button.setTitle("Complete", for: .normal)
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
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60)
            ])
        
        markButton.isEnabled = true
        markButton.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        
    }
    
    @objc func buttonClicked(_ : UIButton) {
        completed = true
        
        // saving to CoreData
        let challenge = CoreDataHelper.newChallenge()
        challenge.completion = completed
        CoreDataHelper.saveChallenge()
        
        // setting it to be green based on Boolean value in CoreData
        if challenge.completion == true {
            markButton.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
            markButton.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
            markButton.setTitle("Completed!", for: .normal)
            markButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)

            // These 2 lines make the whole box jump in front
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        } else {
            markButton.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
            markButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            markButton.setTitle("Complete", for: .normal)
            markButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)

            // These 2 lines make the whole box jump in front
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
        
        markButton.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
        markButton.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
        markButton.setTitle("Completed!", for: .normal)
        markButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)

        // These 2 lines make the whole box jump in front
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
