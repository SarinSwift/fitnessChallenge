//
//  CustomizedDailyChallengesViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

// appears after you selected a cell
// shows 2 cards with a text field that the user can input their daily challenges :)

class CustomizedDailyChallengesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EmojiSetterDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var offsetY:CGFloat = 0
    
    func setEmoji(emoji: String) {
        self.addEmojiButton.setImage(UIImage(named: emoji), for: .normal)
    }
    
    
    let myTableView: UITableView = {
        let tv = UITableView()
        tv.contentMode = .scaleAspectFill
        // standard color is grey, but we want just white
        tv.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
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
        emojiVC.delegate = self
        self.navigationController?.pushViewController(emojiVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupNavBar() {
        navigationItem.title = "Custom Challenge"
    }
    
    func setupTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Makes it so users can't select the cell
        myTableView.isScrollEnabled = false
        myTableView.allowsSelection = false
        
        myTableView.register(CustomChallengeCell.self, forCellReuseIdentifier: "customChallengeCellId")
        
        view.addSubview(myTableView)
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4),
            myTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            myTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
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
    
    
    // stubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customChallengeCellId", for: indexPath) as! CustomChallengeCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 3
    }
    
}

