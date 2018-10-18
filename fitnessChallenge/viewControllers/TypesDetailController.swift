//
//  TypesDetailController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/16/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit


class TypesDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let myTableview: UITableView = {
        let tv = UITableView()
        tv.contentMode = .scaleAspectFill
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    
    let daysCellId = "daysCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Fitness"
    }
    
    func setupTableView() {
        myTableview.delegate = self
        myTableview.dataSource = self
        
        myTableview.register(ThirtyDaysCell.self, forCellReuseIdentifier: daysCellId)
        
        view.addSubview(myTableview)
        
        NSLayoutConstraint.activate([
            myTableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            myTableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            myTableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myTableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: daysCellId, for: indexPath) as! ThirtyDaysCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


class ThirtyDaysCell: UITableViewCell {
    
    // creating the view
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.3921568627, blue: 0.3921568627, alpha: 0.89)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func setupView() {
        addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//class TypesDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
//
//    let headerId = "headerId"
//
//    let tableViewCellId = "tableViewCellId"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView?.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
//        collectionView?.register(TypesDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
//
//        setupNavigationBar()
//    }
//
//    //navigation title
//    func setupNavigationBar() {
//        navigationItem.title = "Fitness"
//    }
//
//
//
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! TypesDetailHeader
//        return header
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        // this shows the table view on the screen
//
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//
//}

//
//class ThirtyDaysCell: UITableViewCell {
//
//    let cellView: UIView = {
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
//        return view
//    }()
//
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupView()
//    }
//
//    func setupView() {
//        addSubview(cellView)
//        cellView.topAnchor.constraint(equalTo: self.topAnchor)
//        cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        cellView.rightAnchor.constraint(equalTo: rightAnchor)
//        cellView.leftAnchor.constraint(equalTo: leftAnchor)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//
//
//// building out the header
//// the header is going to be a cell
//class TypesDetailHeader: BaseCell {
//
//    // creates a tableview
//    let myTableview: UITableView = {
//        let tv = UITableView()
//        tv.contentMode = .scaleAspectFill
//        return tv
//    }()
//
//
//    override func setupViews() {
//        super.setupViews()
//
//
//        // adds a tableview within the header cell
//        addSubview(myTableview)
//        myTableview.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
//        myTableview.translatesAutoresizingMaskIntoConstraints = false
//        myTableview.numberOfRows(inSection: 5)
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": myTableview]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": myTableview]))
//    }
//
//}
//
//// Create this class so we don't have to rewrite code
//class BaseCell: UICollectionViewCell {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    func setupViews() {
//    }
//
//}
