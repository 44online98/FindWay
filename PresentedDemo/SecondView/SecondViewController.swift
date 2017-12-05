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
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "ALERT", style: UIBarButtonItemStyle.plain, target: self, action: #selector(onPressRightBarButtonItem(sender:)))
        
        // add Button
        let closeButton: UIButton = UIButton.init(type: UIButtonType.custom)
        closeButton.frame = CGRect.init(x: 8, y: 8, width: 200, height: 30)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(UIColor.blue, for: .normal)
        closeButton.contentHorizontalAlignment = .left
        closeButton.addTarget(self, action: #selector (onPressShowButton (sender:)),
                                    for: UIControlEvents.touchUpInside)
        self.view.addSubview(closeButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Callback function for popover button.
     @objc func onPressShowButton(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
     @objc func onPressRightBarButtonItem(sender: UIBarButtonItem) {
        let popover : UIViewController = UIViewController()
        // 1 (optional)
        popover.preferredContentSize = CGSize.init(width: 300, height: 300)
        // 2
        popover.modalPresentationStyle = .formSheet
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
    
    func popoverPresentationController(_ popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverTo rect: UnsafeMutablePointer<CGRect>, in view: AutoreleasingUnsafeMutablePointer<UIView>) {
        
    }
    
    // UIAdaptivePresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
