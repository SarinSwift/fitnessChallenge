//
//  CardSwipeViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/15/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class CardSwipeViewController: UICollectionViewController {
    
    // Basically the whole page which is a collectionView!!!
    @IBOutlet private weak var pageCollectionView: UICollectionView!
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the background color for the collection view
        collectionView?.backgroundColor = UIColor.white
        
        // We need to register CategoryCell or else the app will crash becasue we don't know where to get "cellId" from
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    // Telling the collection view how many cells we want to add 
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        return cell
    }
    
    // preparing for a segue!!!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
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



