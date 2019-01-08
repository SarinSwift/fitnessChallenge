//
//  HardTypeDetailController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 12/21/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import  UIKit

// view controller for the customized section

class CustomizedTypeDetailController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    lazy var myCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: view.bounds, collectionViewLayout: flow)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupCollectionView()
    }
    
    func setupNavBar() {
        navigationItem.title = "Custom"
    }
    
    func setupCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.register(ThirtyDayCollectionViewCell.nib, forCellWithReuseIdentifier: "customId")
        
        view.addSubview(myCollectionView)
        
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            myCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            myCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customId", for: indexPath) as! ThirtyDayCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.3921568627, blue: 0.3921568627, alpha: 0.89)
        cell.layer.cornerRadius = 50
        cell.dayLabel.text = "Day \(Int(indexPath.row+1))"
        return cell
    }
    
}

extension CustomizedTypeDetailController: UICollectionViewDelegateFlowLayout {
    
    func showCustomDailyChallenges() {
        let customDailyCh = CustomizedDailyChallengesViewController()
        
        navigationController?.pushViewController(customDailyCh, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4, height: view.frame.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 25, bottom: 10, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showCustomDailyChallenges()
    }
    
}
