//
//  AViewController.swift
//  TTTransitionAnimate
//
//  Created by 李亚坤 on 16/8/12.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    fileprivate lazy var tableView: UITableView = {
        var tempTableView = UITableView(frame: self.view.frame)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()
    
    fileprivate lazy var navigationBar: UINavigationBar = {
        var tempNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        return tempNavigationBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        self.view.addSubview(tableView)
        self.view.addSubview(navigationBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension AViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = ATableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
        }
        cell?.selectionStyle = .default
    
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let a2bVC = ABViewController()
        a2bVC.transitioningDelegate = self
//        self.navigationController?.pushViewController(a2bVC, animated: true)
        self.navigationController?.present(a2bVC, animated: true, completion: nil)
    }
    
}

extension AViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModalTransitionDelegate.animationControllerForPresentedController(presented, presentingController: presenting, sourceController: source)
    }
}

