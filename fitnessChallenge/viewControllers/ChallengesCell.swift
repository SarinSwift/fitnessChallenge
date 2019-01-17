//
//  ChallengesCell.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/17/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

// first card
// The single cell that has the label and the markButton

class ChallengesCell: UITableViewCell {
    
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
