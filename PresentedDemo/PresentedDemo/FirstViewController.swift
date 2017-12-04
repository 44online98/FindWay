//
//  FirstViewController.swift
//  PresentedDemo
//
//  Created by Vinh on 12/4/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First View"
        navigationController?.navigationBar.isTranslucent  = false
        // rightBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Bar+Right", style: UIBarButtonItemStyle.plain, target: self, action: #selector(onPressRightBarButtonItem(sender:)))
        // firstButton
        let firstButton: UIButton = UIButton.init(type: UIButtonType.system)
        firstButton.frame = CGRect.init(x: 8, y: 8, width: 200, height: 30)
        firstButton.setTitle("Popover+AlertView", for: .normal)
        firstButton.contentHorizontalAlignment = .left
        firstButton.addTarget(self, action: #selector (onPressFirstButton(sender:)),
                              for: UIControlEvents.touchUpInside)
        self.view.addSubview(firstButton)
        // secondButton
        let secondButton: UIButton = UIButton.init(type: UIButtonType.system)
        secondButton.frame = CGRect.init(x: 8, y: 54, width: 200, height: 30)
        secondButton.setTitle("Popover+ActionSheet", for: .normal)
        secondButton.contentHorizontalAlignment = .left
        secondButton.addTarget(self, action: #selector (onPressSecondButton (sender:)),
                               for: UIControlEvents.touchUpInside)
        self.view.addSubview(secondButton)
        // thirdButton
        let thirdButton: UIButton = UIButton.init(type: UIButtonType.system)
        thirdButton.frame = CGRect.init(x: 8, y: 100, width: 200, height: 30)
        thirdButton.setTitle("Popover+Up", for: .normal)
        thirdButton.contentHorizontalAlignment = .left
        thirdButton.addTarget(self, action: #selector (onPressThirdButton (sender:)),
                               for: UIControlEvents.touchUpInside)
        self.view.addSubview(thirdButton)
        // fourthButton
        let fourthButton: UIButton = UIButton.init(type: UIButtonType.system)
        fourthButton.frame = CGRect.init(x: 8, y: 100, width: 200, height: 30)
        fourthButton.setTitle("Popover+Custom", for: .normal)
        fourthButton.contentHorizontalAlignment = .left
        fourthButton.addTarget(self, action: #selector (onPressFourthButton (sender:)),
                              for: UIControlEvents.touchUpInside)
        self.view.addSubview(fourthButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Callback function for popover button.
    @objc func onPressFirstButton(sender: UIButton) {
        let popover = UIAlertController(title: "Alert", message: "Popover+AlertView", preferredStyle: UIAlertControllerStyle.alert
        )
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: {(alert :UIAlertAction!) in
            print("Delete button tapped")
        })
        popover.addAction(deleteAction)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert :UIAlertAction!) in
            print("OK button tapped")
        })
        popover.addAction(okAction)
        present(popover, animated: true, completion: nil)
    }
    
    @objc func onPressSecondButton(sender: UIButton) {
        let popover = UIAlertController(title: "ActionSheet", message: "Popover+ActionSheet", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: {(alert :UIAlertAction!) in
            print("Delete button tapped")
        })
        popover.addAction(deleteAction)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert :UIAlertAction!) in
            print("OK button tapped")
        })
        popover.addAction(okAction)
        present(popover, animated: true, completion: nil)
    }
    
    @objc func onPressThirdButton(sender: UIButton) {
        let popoverViewController : UIViewController = UIViewController()
        // 1 (optional)
        popoverViewController.preferredContentSize = CGSize.init(width: 300, height: 300)
        // 2
        popoverViewController.modalPresentationStyle = .popover
        // 3
        popoverViewController.popoverPresentationController?.delegate = self
        // 4
        popoverViewController.popoverPresentationController?.sourceView = sender
        // 5 (optional)
        popoverViewController.popoverPresentationController?.sourceRect = sender.bounds
        // 6 (optional)
        popoverViewController.popoverPresentationController?.permittedArrowDirections = .up
        present(popoverViewController, animated: true, completion: nil)
    }
    
    @objc func onPressFourthButton(sender: UIButton) {
        let popoverViewController : UIViewController = UIViewController()
        popoverViewController.preferredContentSize = CGSize.init(width: 300, height: 300)
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.popoverPresentationController?.delegate = self
        popoverViewController.popoverPresentationController?.sourceView = sender
        popoverViewController.popoverPresentationController?.sourceRect = sender.bounds
        popoverViewController.popoverPresentationController?.permittedArrowDirections = .up
        present(popoverViewController, animated: true, completion: nil)
    }
    
    @objc func onPressRightBarButtonItem(sender: UIBarButtonItem) {
        let popoverViewController : UIViewController = UIViewController()
        popoverViewController.preferredContentSize = CGSize.init(width: 300, height: 300)
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.popoverPresentationController?.delegate = self
        popoverViewController.popoverPresentationController?.barButtonItem = sender
        popoverViewController.popoverPresentationController?.permittedArrowDirections = .up
        present(popoverViewController, animated: true, completion: nil)
    }
    
}
// Mark: - UIPopoverPresentationControllerDelegate
extension FirstViewController: UIPopoverPresentationControllerDelegate{
    
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
