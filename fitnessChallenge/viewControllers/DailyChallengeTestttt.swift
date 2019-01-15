//
//  DailyChallengeTestttt.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/14/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class DailyChallengeTest: UIViewController, EmojiSetterDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let pinkView1: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9342781305, green: 0.3532425165, blue: 0.3745281994, alpha: 0.89)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let challengeLabel1: UILabel = {
        let label = UILabel()
        label.text = "10000 squatss :)"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var markButton1: UIButton = {
        let button = UIButton()
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.9342781305, green: 0.3532425165, blue: 0.3745281994, alpha: 0.89)
        button.isEnabled = true
        button.addTarget(self, action: #selector(buttonClicked1(_ :)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pinkView2: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9342781305, green: 0.3532425165, blue: 0.3745281994, alpha: 0.89)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let challengeLabel2: UILabel = {
        let label = UILabel()
        label.text = "10000 :)"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var markButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.9342781305, green: 0.3532425165, blue: 0.3745281994, alpha: 0.89)
        button.isEnabled = true
        button.addTarget(self, action: #selector(buttonClicked2(_ :)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let addEmojiButton: UIButton = {
        let button = UIButton()
        button.setTitle("Feeling", for: .normal)
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
    func setEmoji(emoji: String) {
        self.addEmojiButton.setImage(UIImage(named: emoji), for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(pinkView1)
        view.addSubview(addEmojiButton)
        view.addSubview(pinkView2)
        
        pinkView1.addSubview(challengeLabel1)
        pinkView1.addSubview(markButton1)
        pinkView2.addSubview(challengeLabel2)
        pinkView2.addSubview(markButton2)
        
        NSLayoutConstraint.activate([
            pinkView1.heightAnchor.constraint(equalToConstant: 180),
            pinkView1.widthAnchor.constraint(equalToConstant: view.bounds.width - 20),
            pinkView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pinkView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 110)
            ])
        NSLayoutConstraint.activate([
            pinkView2.heightAnchor.constraint(equalToConstant: 180),
            pinkView2.widthAnchor.constraint(equalToConstant: view.bounds.width - 20),
            pinkView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pinkView2.topAnchor.constraint(equalTo: pinkView1.bottomAnchor, constant: 80)
            ])
        
        NSLayoutConstraint.activate([
            markButton1.centerYAnchor.constraint(equalTo: pinkView1.centerYAnchor),
            markButton1.rightAnchor.constraint(equalTo: pinkView1.rightAnchor, constant: -10),
            markButton1.heightAnchor.constraint(equalToConstant: 60),
            markButton1.widthAnchor.constraint(equalToConstant: 110)
            ])
        NSLayoutConstraint.activate([
            markButton2.centerYAnchor.constraint(equalTo: pinkView2.centerYAnchor),
            markButton2.rightAnchor.constraint(equalTo: pinkView2.rightAnchor, constant: -10),
            markButton2.heightAnchor.constraint(equalToConstant: 60),
            markButton2.widthAnchor.constraint(equalToConstant: 110)
            ])
        
        NSLayoutConstraint.activate([
            challengeLabel1.heightAnchor.constraint(equalToConstant: 100),
            challengeLabel1.widthAnchor.constraint(equalToConstant: 120),
            challengeLabel1.centerXAnchor.constraint(equalTo: pinkView1.centerXAnchor),
            challengeLabel1.centerYAnchor.constraint(equalTo: pinkView1.centerYAnchor),
            challengeLabel1.leftAnchor.constraint(equalTo: pinkView1.leftAnchor, constant: 10),
            challengeLabel1.rightAnchor.constraint(equalTo: markButton1.leftAnchor, constant: -0.5)
            ])
        NSLayoutConstraint.activate([
            challengeLabel2.heightAnchor.constraint(equalToConstant: 100),
            challengeLabel2.widthAnchor.constraint(equalToConstant: 120),
            challengeLabel2.centerXAnchor.constraint(equalTo: pinkView2.centerXAnchor),
            challengeLabel2.centerYAnchor.constraint(equalTo: pinkView2.centerYAnchor),
            challengeLabel2.leftAnchor.constraint(equalTo: pinkView2.leftAnchor, constant: 10),
            challengeLabel2.rightAnchor.constraint(equalTo: markButton2.leftAnchor, constant: -0.5)
            ])
        
        addEmojiButton.heightAnchor.constraint(equalToConstant: 110).isActive = true
        addEmojiButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        addEmojiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (view.bounds.height / 3) + 20).isActive = true
        addEmojiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    @objc func buttonClicked1(_ : UIButton) {
        
        markButton1.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
        markButton1.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
        markButton1.setTitle("Completed!", for: .normal)
        markButton1.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        
        // These 2 lines make the whole box jump in front
        markButton1.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.markButton1.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    @objc func buttonClicked2(_ : UIButton) {
        
        markButton2.backgroundColor = UIColor(red: 175/255, green: 210/255, blue: 117/255, alpha: 1)
        markButton2.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.8235294118, blue: 0.4588235294, alpha: 1)
        markButton2.setTitle("Completed!", for: .normal)
        markButton2.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        
        // These 2 lines make the whole box jump in front
        markButton2.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.markButton2.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
}
