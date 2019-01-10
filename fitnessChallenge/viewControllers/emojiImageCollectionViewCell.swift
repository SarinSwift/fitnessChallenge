//
//  emojiImageCollectionViewCell.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

// collectionViewCell for ChooseEmojiViewController

class emojiImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cellId"

    @IBOutlet weak var emojiImage: UIImageView!
    
    
    // this static var allows to access this variable in ChooseEmojiVIewContorller
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func setupImage(image: UIImage) {
        self.emojiImage.image = image
    }

}
