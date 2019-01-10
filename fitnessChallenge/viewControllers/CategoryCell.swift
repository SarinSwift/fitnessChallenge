//
//  CategoryCell.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/15/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//



// collection view cell for the cardSwipeViewController


import Foundation
import UIKit

//This is the class the CardSwipeViewController contains
//Vertical scroll
class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Now our categoryCell has a property called 'cardSwipeController'
    var cardSwipeController: CardSwipeViewController?
    
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
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
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
    let titles = ["Body fitness challenge", "Body fitness challenge 2", "Customized body fitness"]
    // create an array for the different cell labels
    let descriptions = ["Easy to follow 30 day challenges on health and diet", "Easy to follow 30 day challenges on exercise and diet", "Create your own 30 day workout and diet challenges that fits for you!"]
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = titles[indexPath.row]
        if type == titles[0] {
            cardSwipeController?.showThirtyDayChallengeForType(type: type)
        } else if type == titles[1] {
            cardSwipeController?.showThirtyDayChallengeForType1(type: type)
        } else if type == titles[2] {
            cardSwipeController?.showThirtyDayChallengeForType2(type: type)
        }
    }
    
}
