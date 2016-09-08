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
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()
    
    private lazy var navigationBar: UINavigationBar = {
        var tempNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        return tempNavigationBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()

        self.view.addSubview(tableView)
        self.view.addSubview(navigationBar)
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
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = ATableViewCell(style: .Value1, reuseIdentifier: cellIdentifier)
        }
        cell?.selectionStyle = .Default
    
        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let a2bVC = ABViewController()
        a2bVC.transitioningDelegate = self
//        self.navigationController?.pushViewController(a2bVC, animated: true)
        self.navigationController?.presentViewController(a2bVC, animated: true, completion: nil)
    }
    
}

extension AViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModalTransitionDelegate.animationControllerForPresentedController(presented, presentingController: presenting, sourceController: source)
    }
}

