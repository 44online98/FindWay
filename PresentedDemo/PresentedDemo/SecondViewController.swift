//
//  SecondViewController.swift
//  PresentedDemo
//
//  Created by Vinh on 12/4/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second View"
        self.view.backgroundColor = UIColor.red
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "ALERT", style: UIBarButtonItemStyle.plain, target: self, action: #selector(onPressRightBarButtonItem(sender:)))
        
        // add Button
        let showButton: UIButton = UIButton.init(type: UIButtonType.custom)
        showButton.frame = CGRect.init(x: 80, y: 80, width: 50, height: 50)
        showButton.setTitle("Show", for: .normal)
        showButton.addTarget(self, action: #selector (onPressShowButton (sender:)),
                                    for: UIControlEvents.touchUpInside)
        self.view.addSubview(showButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Callback function for popover button.
     @objc func onPressShowButton(sender: UIButton) {
        let popover : UIViewController = UIViewController()
        // 1 (optional)
        popover.preferredContentSize = CGSize.init(width: 300, height: 300)
        // 2
        popover.modalPresentationStyle = .popover
        // 3
        popover.popoverPresentationController?.delegate = self
        // 4
        popover.popoverPresentationController?.sourceView = sender
        // 5 (optional)
        popover.popoverPresentationController?.sourceRect = sender.bounds
        // 6 (optional)
        popover.popoverPresentationController?.permittedArrowDirections = .up
        
        present(popover, animated: true, completion: nil)
    }
    
     @objc func onPressRightBarButtonItem(sender: UIBarButtonItem) {
        let popover : UIViewController = UIViewController()
        // 1 (optional)
        popover.preferredContentSize = CGSize.init(width: 300, height: 300)
        // 2
        popover.modalPresentationStyle = .popover
        // 3
        popover.popoverPresentationController?.delegate = self
        // 4
        popover.popoverPresentationController?.barButtonItem = sender
        // 5 (optional)
        popover.popoverPresentationController?.permittedArrowDirections = .up
        
        present(popover, animated: true, completion: nil)
    }
    
}
// Mark: - UIPopoverPresentationControllerDelegate
extension SecondViewController:  UIPopoverPresentationControllerDelegate{
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        // Will Dismiss
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        // Did Dismiss
       
    }
    
    // UIAdaptivePresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
