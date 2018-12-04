//
//  ChooseEmojiViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 11/28/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit

class ChooseEmojiViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pickEmojiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
