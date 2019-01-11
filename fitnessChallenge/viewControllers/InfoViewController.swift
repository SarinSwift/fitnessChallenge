//
//  InfoViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/10/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit
import SafariServices

class InfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let exerImages = ["arms", "legs", "abs", "chest", "back", "shoulders", "calves"]
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(InfoExerciseCell.self, forCellWithReuseIdentifier: "infoCellId") 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCellId", for: indexPath) as! InfoExerciseCell
//        cell.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        cell.exerciseImageView.image = UIImage(named: exerImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = NSURL(string: "https://wger.de/en/exercise/overview/"){
            let svc = SFSafariViewController(url: url as URL)
            present(svc, animated: true, completion: nil)
        }
    }
    
}

class InfoExerciseCell: UICollectionViewCell {
    
    let exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(exerciseImageView)
        NSLayoutConstraint(item: exerciseImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: exerciseImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: exerciseImageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: exerciseImageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
