//
//  TypesDetailController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/16/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit


class TypesDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView?.register(TypesDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! TypesDetailHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // this shows the table view on the screen
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

// building out the header
// the header is going to be a cell
class TypesDetailHeader: BaseCell {
    
    let myTableview: UITableView = {
        let tv = UITableView()
        tv.contentMode = .scaleAspectFill
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        // adds a tableview within the header cell
        addSubview(myTableview)
        
        myTableview.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        myTableview.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": myTableview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": myTableview]))
    }
    
}

// Create this class so we don't have to rewrite code
class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }

}
