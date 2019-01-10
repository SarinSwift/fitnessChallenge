//
//  TypesCell.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/9/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

//This is the class the CategoryCell contains
//Horizontal scroll
class typesCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Creating the title label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Body fitness challenge"
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9333333333, green: 0.3529411765, blue: 0.3764705882, alpha: 1)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Easy to follow 30 day challenges on exercise and diet"
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 4
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9333333333, green: 0.3529411765, blue: 0.3764705882, alpha: 0.89)
        return label
    }()
    
    
    // sets up the view for our horizontal scroll cells
    func setupViews() {
        backgroundColor = UIColor.clear
        layer.borderWidth = 2.5
        layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.2392156863, blue: 0.4039215686, alpha: 1)
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
        // adding to the subview hierarchy
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: frame.width / 4, y: 100, width: 200, height: 70)
        addSubview(descriptionLabel)
        descriptionLabel.frame = CGRect(x: frame.width / 5.2, y: frame.height / 2, width: 240, height: 120)
    }
}
