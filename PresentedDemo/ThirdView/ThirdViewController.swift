//
//  ThirdViewController.swift
//  PresentedDemo
//
//  Created by Vinh on 12/5/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Third View"
        navigationController?.navigationBar.isTranslucent  = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
