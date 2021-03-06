//
//  ViewController.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 10/14/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import UIKit

// Main page in storyboard

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
}
