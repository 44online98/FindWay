//
//  SecondViewController.swift
//  PresentedDemo
//
//  Created by Vinh on 12/4/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second View"
        navigationController?.navigationBar.isTranslucent  = false
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Push", style: UIBarButtonItemStyle.plain, target: self, action: #selector(onPressRightBarButtonItem(sender:)))
        
        // add Button
        let closeButton: UIButton = UIButton.init(type: UIButtonType.custom)
        closeButton.frame = CGRect.init(x: 8, y: 8, width: 200, height: 30)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(UIColor.blue, for: .normal)
        closeButton.contentHorizontalAlignment = .left
        closeButton.addTarget(self, action: #selector (onPressCloseButton (sender:)),
                                    for: UIControlEvents.touchUpInside)
        self.view.addSubview(closeButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Callback function onPress button.
     @objc func onPressCloseButton(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
     @objc func onPressRightBarButtonItem(sender: UIBarButtonItem) {
        let thirdView : ThirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(thirdView, animated: true)
    }
    
}

