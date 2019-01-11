//
//  CardSwipeViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/15/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//


// View controller for the card collection view


import Foundation
import UIKit

// The collectionViewController in Main.storyboard

class CardSwipeViewController: UICollectionViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the background color for the collection view
        collectionView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // We need to register CategoryCell or else the app will crash becasue we don't know where to get "cellId" from
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    // pushes from easy challenges
    func showThirtyDayChallengeForType(type: String) {
        // where the code written in TypesDetailController is shown on the screen
        let easyDetailC = TypesDetailController()
        
        //Here is where we push view view controller
        navigationController?.pushViewController(easyDetailC, animated: true)
    }
    // pushes from the med challenges
    func showThirtyDayChallengeForType1(type: String) {
        let medDetailC = MedTypeDetailController()
        navigationController?.pushViewController(medDetailC, animated: true)
    }
    // pushes from hard challenges
    func showThirtyDayChallengeForType2(type: String) {
        let CustomDetailC = CustomizedTypeDetailController()
        navigationController?.pushViewController(CustomDetailC, animated: true)
    }
    
    // Telling the collection view how many cells we want to add 
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        // This adds the code we wrote in
        // CategoryCell.swift
        // didSelectItemAt
        cell.cardSwipeController = self
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
}

extension CardSwipeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Makes each cell have the width of the entire view
        return CGSize(width: (view.frame.width), height: view.frame.height - 80)
    }
}



