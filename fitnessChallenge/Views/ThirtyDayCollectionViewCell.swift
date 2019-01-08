//
//  ThirtyDayCollectionViewCell.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

// xib cell for the CustomizedTypeDetailController.swift

class ThirtyDayCollectionViewCell: UICollectionViewCell {
    
    let identifier = "customId"

    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dayLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

}
