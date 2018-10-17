//
//  CategoryCell.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/15/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

//This is the class the CardSwipeViewController contains
//Vertical scroll
class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "typesCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Adding the collection view within my cell.
    let typesCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        // It's set bny default to vertical,
        // but we want to let it scroll horizontally
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // Setting the background of the
        // vertical collection view to a
        // blue color
        collectionView.backgroundColor = UIColor.clear
        
        // in order for my constraints to work,
        // i have to turn auto resizing masks
        // to constraints off
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    
    
    func setupViews() {
        backgroundColor = UIColor.clear
        
        // Adds typesCollectionView to the subview hierarchy of the vertical cell
        addSubview(typesCollectionView)
        
        typesCollectionView.delegate = self
        typesCollectionView.dataSource = self
        
        // Need to register our typesCell to our collectionView
        typesCollectionView.register(typesCell.self, forCellWithReuseIdentifier: cellId)
        
        // "H: |[v0]|" This means to expand horizontally from the left to the right edge with v0 being our specificCategoryCell
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": typesCollectionView]))
//        // "V: |[v0]|" means to expand vertically from top to bottom edge with v0 being our specificCategoryCell
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": typesCollectionView]))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    // create an array for the different cell labels
    let titles = ["Body fitness challenge", "Customized body fitness", "Body fitness challenge 2"]
    // create an array for the different cell labels
    let descriptions = ["Easy to follow 30 day challenges on health and diet", "Create your own 30 day workout and diet challenges that fits for you!", "Easy to follow 30 day challenges on exercise and diet"]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // This is returning the typesCell (horizontal scroll)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! typesCell
        // Setting the title labels and description to the following array
        cell.titleLabel.text = titles[indexPath.item]
        cell.descriptionLabel.text = descriptions[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // didn't need to call 'view.frame.height' because cells already have views on it
        return CGSize(width: (frame.width - 40), height: (frame.height - 100))
    }
    
}



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
        layer.borderWidth = 3
        layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
        // adding to the subview hierarchy
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: frame.width / 4, y: 100, width: 200, height: 70)
        addSubview(descriptionLabel)
        descriptionLabel.frame = CGRect(x: frame.width / 5.2, y: frame.height / 2, width: 240, height: 120)
    }
}





