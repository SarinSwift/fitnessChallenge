//
//  ChooseEmojiViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 11/28/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

// Icon made by Freepik from www.flaticon.com
// https://www.flaticon.com/free-icons/emo
// https://emojiisland.com/pages/free-download-emoji-icons-png

import UIKit



// called when the user presses the addEmojiButton

class ChooseEmojiViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var delegate: EmojiSetterDelegate?
    
    let emojiImages = ["smile", "inlove", "happy", "neutral", "thinking", "cry", "mad"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pickEmojiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(emojiImageCollectionViewCell.nib, forCellWithReuseIdentifier: emojiImageCollectionViewCell.identifier)
        
        
        collectionView.allowsMultipleSelection = false
    }
    
    @IBAction func pickEmojiButtonTapped(_ sender: Any) {
        
        func yesHandler(alert: UIAlertAction!) {
            
            
            
            guard let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first else {
                return
            }
            delegate?.setEmoji(emoji: emojiImages[selectedIndexPath.row])
            // shouldn't be instantiating?? because it doensn't know which
            let dailyVC = DailyChallengesViewController()
            dailyVC.addEmojiButton.setImage(UIImage(named: "\(emojiImages[selectedIndexPath.row])"), for: .normal)
            // popping only once you have an emoji selected
            navigationController?.popViewController(animated: true)
        }
        
        let alertController = UIAlertController(title: "Submit", message: "we will set this emoji", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let yesAction = UIAlertAction(title: "Yes!", style: .default, handler: yesHandler)
        
        
        alertController.addAction(cancelAction)
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
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
        cell?.layer.borderWidth = 3.5
        cell?.layer.cornerRadius = 36
        cell?.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        
    }
    
}
