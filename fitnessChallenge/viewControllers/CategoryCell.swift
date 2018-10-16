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
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": typesCollectionView]))
//        // "V: |[v0]|" means to expand vertically from top to bottom edge with v0 being our specificCategoryCell
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": typesCollectionView]))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // This is returning the typesCell (horizontal scroll)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
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
    
    // sets up the view for our horizontal scroll cells 
    func setupViews() {
        backgroundColor = UIColor.clear
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 5
    }
}




