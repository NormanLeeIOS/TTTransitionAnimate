//
//  AViewController.swift
//  TTTransitionAnimate
//
//  Created by 李亚坤 on 16/8/12.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        var tempTableView = UITableView(frame: self.view.frame)
        return tempTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        tableView.delegate = self
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension AViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
//        if cell == nil {
//            cell = UITableViewCell(style: .Value1, reuseIdentifier: identifier)
//        }
//        
//        cell?.textLabel?.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.2)
//        cell?.textLabel?.text = "这不是扯淡么..."
//        cell?.textLabel?.textColor = UIColor.darkTextColor()
//        cell?.selectionStyle = .Default
    
        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
