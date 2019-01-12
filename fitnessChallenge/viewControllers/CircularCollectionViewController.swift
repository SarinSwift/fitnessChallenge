//
//  CircularCollectionViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/11/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit
import SafariServices

private let reuseIdentifier = "Cell"

class CircularCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let exerImages = ["arms", "legs", "abs", "chest", "back", "shoulders", "calves"]
    let exerImagesText = ["Arms", "Legs", "Abs", "Chest", "Back", "Shoulders", "Calves"]
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Targeted Muscle Groups and Exercises"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 22)
        label.numberOfLines = 10
        label.textAlignment = .center
        label.layer.borderWidth = 2
        label.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.backgroundColor = #colorLiteral(red: 0.9342781305, green: 0.3532425165, blue: 0.3745281994, alpha: 1)
        
        self.collectionView!.register(CircularCollectionViewCell.self, forCellWithReuseIdentifier: "circleCellId")
        let imageView = UIImageView(image: UIImage(named: "bg-dark"))
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        view.addSubview(infoLabel)
        
        NSLayoutConstraint(item: infoLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 130).isActive = true
        NSLayoutConstraint(item: infoLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: infoLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = true
        NSLayoutConstraint(item: infoLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 330).isActive = true
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // redirects to the exercises web page
        if let url = NSURL(string: "https://wger.de/en/exercise/overview/"){
            let svc = SFSafariViewController(url: url as URL)
            present(svc, animated: true, completion: nil)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "circleCellId", for: indexPath) as! CircularCollectionViewCell
        cell.imageName = exerImages[indexPath.row]
        cell.exerciseLabel.text = exerImagesText[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.layer.cornerRadius = 5
        return cell
    }
    
}

class CircularCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let exerciseLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name:"helvetica", size: 22.0)
        label.contentMode = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageName: String = "" {
        didSet {
            imageView.image = UIImage(named: imageName)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.layer.borderWidth = 3.7
        contentView.layer.cornerRadius = 5
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
        contentView.clipsToBounds = true
        
        addSubview(imageView)
        addSubview(exerciseLabel)
        
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: exerciseLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: exerciseLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: exerciseLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        let circularlayoutAttributes = layoutAttributes as! CircularCollectionViewLayoutAttributes
        self.layer.anchorPoint = circularlayoutAttributes.anchorPoint
        // update center.y to the center of the layout circle to compensate for the change in anchorPoint.y
        self.center.y += (circularlayoutAttributes.anchorPoint.y - 0.5) * self.bounds.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
