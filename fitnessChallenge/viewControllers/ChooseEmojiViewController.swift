//
//  ChooseEmojiViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 11/28/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit

class ChooseEmojiViewController: UIViewController {
    
    // Icon made by Freepik from www.flaticon.com 
    let emojiImages = ["smile", "inlove", "happy", "neutral", "thinking", "cry", "mad"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pickEmojiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(emojiImageCollectionViewCell.nib, forCellWithReuseIdentifier: emojiImageCollectionViewCell.identifier)
        
        
        collectionView.allowsMultipleSelection = false
    }
    
    @IBAction func pickEmojiButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Submit", message: "we will set this emoji", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let yesAction = UIAlertAction(title: "Yes!", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
    }
    
}

extension ChooseEmojiViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: emojiImageCollectionViewCell.identifier, for: indexPath) as! emojiImageCollectionViewCell
        cell.setupImage(image: UIImage(named: emojiImages[indexPath.row])!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/5, height: collectionViewWidth/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 2
        cell?.layer.cornerRadius = 38
        cell?.layer.borderColor = #colorLiteral(red: 0.928014338, green: 0.1565714478, blue: 0.1036314741, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        
    }
    
}
