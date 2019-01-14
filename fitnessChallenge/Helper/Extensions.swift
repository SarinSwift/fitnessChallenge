//
//  Extensions.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/14/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

// can use in any UIView(which inherits from UIResponder) to find a parent view of a specific type
// using this we can extend UITableViewCell

extension UIResponder {
    
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
    
}


// extend with some convenient read-only computed properties for the table view and index path

extension UITableViewCell {
    
    var tableView: UITableView? {
        return next(UITableView.self)
    }
    
    var indexPath: IndexPath? {
        return tableView?.indexPath(for: self)
    }
    
}
