//
//  SecondViewController.swift
//  PresentedDemo
//
//  Created by Vinh on 12/4/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let refreshControl = UIRefreshControl()
    var listFeature = ["Popover+AlertView", "Popover+ActionSheet", "Popover+Left", "Popover+FormSheet", "Popover+Navigation", "Popover+CustomTransition" ]
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    
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
        // add tableView
        let tableView : UITableView = UITableView.init(frame: CGRect.init(x: 0, y: 36, width: 300,height: 250 ), style: UITableViewStyle.plain)
        tableView.dataSource  = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshTableView(_:)), for: .valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func refreshTableView (_ sender: Any) {
        print("endRefreshing!!!")
        self.refreshControl.endRefreshing()
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
// MARK: - UITableViewDataSource
extension SecondViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listFeature.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "identifier"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = self.listFeature[indexPath.row]
        return cell!
    }
}

// MARK: - UITableViewDelegate
extension SecondViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        case 5:
            break
        default:
            break
        }
        
    }
}
