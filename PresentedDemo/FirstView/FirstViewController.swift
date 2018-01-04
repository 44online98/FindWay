//
//  FirstViewController.swift
//  PresentedDemo
//
//  Created by Vinh on 12/4/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - View Lifecycle
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
        thirdButton.setTitle("Popover+Left", for: .normal)
        thirdButton.contentHorizontalAlignment = .left
        thirdButton.addTarget(self, action: #selector (onPressThirdButton (sender:)),
                              for: UIControlEvents.touchUpInside)
        self.view.addSubview(thirdButton)
        // fourthButton
        let fourthButton: UIButton = UIButton.init(type: UIButtonType.system)
        fourthButton.frame = CGRect.init(x: 8, y: 146, width: 200, height: 30)
        fourthButton.setTitle("Popover+FormSheet", for: .normal)
        fourthButton.contentHorizontalAlignment = .left
        fourthButton.addTarget(self, action: #selector (onPressFourthButton (sender:)),
                               for: UIControlEvents.touchUpInside)
        self.view.addSubview(fourthButton)
        // fifthButton
        let fifthButton: UIButton = UIButton.init(type: UIButtonType.system)
        fifthButton.frame = CGRect.init(x: 8, y: 192, width: 200, height: 30)
        fifthButton.setTitle("Popover+Navigation", for: .normal)
        fifthButton.contentHorizontalAlignment = .left
        fifthButton.addTarget(self, action: #selector (onPressFifthButton (sender:)),
                               for: UIControlEvents.touchUpInside)
        self.view.addSubview(fifthButton)
        // sixthButton
        let sixthButton: UIButton = UIButton.init(type: UIButtonType.system)
        sixthButton.frame = CGRect.init(x: 8, y: 238, width: 200, height: 30)
        sixthButton.setTitle("Popover+CustomTransition", for: .normal)
        sixthButton.contentHorizontalAlignment = .left
        sixthButton.addTarget(self, action: #selector (onPressSixthButton (sender:)),
                               for: UIControlEvents.touchUpInside)
        self.view.addSubview(sixthButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Callback function onPress button.
    @objc func onPressFirstButton(sender: UIButton) {
        let popoverView = UIAlertController(title: "Alert", message: "Popover+AlertView", preferredStyle: UIAlertControllerStyle.alert
        )
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: {(alert :UIAlertAction!) in
            print("Delete button tapped")
        })
        popoverView.addAction(deleteAction)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert :UIAlertAction!) in
            print("OK button tapped")
        })
        popoverView.addAction(okAction)
        if (UIDevice.current.userInterfaceIdiom == .pad){
            popoverView.modalPresentationStyle = .popover
            popoverView.popoverPresentationController?.delegate = self
            popoverView.popoverPresentationController?.sourceView = sender
            popoverView.popoverPresentationController?.sourceRect = sender.bounds
            popoverView.popoverPresentationController?.permittedArrowDirections = .left
        }
        present(popoverView, animated: true, completion: nil)
    }
    
    @objc func onPressSecondButton(sender: UIButton) {
        let popoverView = UIAlertController(title: "ActionSheet", message: "Popover+ActionSheet", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: {(alert :UIAlertAction!) in
            print("Delete button tapped")
        })
        popoverView.addAction(deleteAction)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert :UIAlertAction!) in
            print("OK button tapped")
        })
        popoverView.addAction(okAction)
        if (UIDevice.current.userInterfaceIdiom == .pad){
            popoverView.modalPresentationStyle = .popover
            popoverView.popoverPresentationController?.delegate = self
            popoverView.popoverPresentationController?.sourceView = sender
            popoverView.popoverPresentationController?.sourceRect = sender.bounds
            popoverView.popoverPresentationController?.permittedArrowDirections = .left
        }
        present(popoverView, animated: true, completion: nil)
    }
    
    @objc func onPressThirdButton(sender: UIButton) {
        let popoverView : UIViewController = UIViewController()
        // 1 (optional)
        popoverView.preferredContentSize = CGSize.init(width: 300, height: 300)
        // 2
        popoverView.modalPresentationStyle = .popover
        // 3
        popoverView.popoverPresentationController?.delegate = self
        // 4
        popoverView.popoverPresentationController?.sourceView = sender
        // 5 (optional)
        popoverView.popoverPresentationController?.sourceRect = sender.bounds
        // 6 (optional)
        popoverView.popoverPresentationController?.permittedArrowDirections = .left
        present(popoverView, animated: true, completion: nil)
    }
    
    @objc func onPressFourthButton(sender: UIButton) {
        let popoverView : SecondViewController = SecondViewController()
        popoverView.preferredContentSize = CGSize.init(width: 300, height: 300)
        if (UIDevice.current.userInterfaceIdiom == .pad){
            popoverView.modalPresentationStyle = .formSheet
        }else{
            popoverView.modalPresentationStyle = .popover
        }
        popoverView.popoverPresentationController?.delegate = self
        popoverView.popoverPresentationController?.sourceView = sender
        popoverView.popoverPresentationController?.sourceRect = sender.bounds
        popoverView.popoverPresentationController?.permittedArrowDirections = .left
        present(popoverView, animated: true, completion: nil)
    }
    
    @objc func onPressFifthButton(sender: UIButton) {
        let secondView : SecondViewController = SecondViewController()
        let popoverView = UINavigationController(rootViewController: secondView)
        popoverView.preferredContentSize = CGSize.init(width: 300, height: 300)
        if (UIDevice.current.userInterfaceIdiom == .pad){
            popoverView.modalPresentationStyle = .formSheet
        }else{
            popoverView.modalPresentationStyle = .popover
        }
        popoverView.popoverPresentationController?.delegate = self
        popoverView.popoverPresentationController?.sourceView = sender
        popoverView.popoverPresentationController?.sourceRect = sender.bounds
        popoverView.popoverPresentationController?.permittedArrowDirections = .left
        present(popoverView, animated: true, completion: nil)
    }
    
    @objc func onPressSixthButton(sender: UIButton) {
        let secondView : SecondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
//        let secondView : SecondViewController = SecondViewController()
//        let popoverView = UINavigationController(rootViewController: secondView)
//        popoverView.preferredContentSize = CGSize.init(width: 300, height: 300)
//        if (UIDevice.current.userInterfaceIdiom == .pad){
//            popoverView.modalPresentationStyle = .formSheet
//        }else{
//            popoverView.modalPresentationStyle = .popover
//        }
//        popoverView.popoverPresentationController?.delegate = self
//        popoverView.popoverPresentationController?.sourceView = sender
//        popoverView.popoverPresentationController?.sourceRect = sender.bounds
//        popoverView.popoverPresentationController?.permittedArrowDirections = .left
//        present(popoverView, animated: true, completion: nil)
    }
    
    @objc func onPressRightBarButtonItem(sender: UIBarButtonItem) {
        let popoverView : UIViewController = UIViewController()
        popoverView.preferredContentSize = CGSize.init(width: 300, height: 300)
        popoverView.modalPresentationStyle = .popover
        popoverView.popoverPresentationController?.delegate = self
        popoverView.popoverPresentationController?.barButtonItem = sender
        popoverView.popoverPresentationController?.permittedArrowDirections = .up
        present(popoverView, animated: true, completion: nil)
    }
    
}

// MARK: - - UIPopoverPresentationControllerDelegate
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



