//
//  InfoViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/10/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//
// https://icons8.com/icon/set/exercise/metro

import UIKit
import SafariServices

class InfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let exerImages = ["arms", "legs", "abs", "chest", "back", "shoulders", "calves"]
    
    @IBOutlet weak var infoLabel: UILabel!
//    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.itemSize = CGSize(width: view.frame.width, height: 700)
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
//        collectionView.contentInset = UIEdgeInsets(top: -60, left: 0, bottom: 0, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(InfoExerciseCell.self, forCellWithReuseIdentifier: "infoCellId")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCellId", for: indexPath) as! InfoExerciseCell
//        cell.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        cell.exerciseImageView.image = UIImage(named: exerImages[indexPath.row])
        cell.exerciseLabel.text = exerImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // redirects to the exercises web page
        if let url = NSURL(string: "https://wger.de/en/exercise/overview/"){
            let svc = SFSafariViewController(url: url as URL)
            present(svc, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 135, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 70, left: 40, bottom: 10, right: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
}

class InfoExerciseCell: UICollectionViewCell {
    
    let exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let exerciseLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.contentMode = .center
        label.textColor = #colorLiteral(red: 0.9342781305, green: 0.3532425165, blue: 0.3764705882, alpha: 0.89)
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    func addViews() {
        addSubview(exerciseImageView)
        addSubview(exerciseLabel)
        
        NSLayoutConstraint(item: exerciseImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -30).isActive = true
        NSLayoutConstraint(item: exerciseImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: exerciseImageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: exerciseImageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: -8).isActive = true
        
        NSLayoutConstraint(item: exerciseLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: exerciseLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: exerciseLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
