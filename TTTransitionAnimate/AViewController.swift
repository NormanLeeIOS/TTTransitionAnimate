//
//  AViewController.swift
//  TTTransitionAnimate
//
//  Created by 李亚坤 on 16/8/12.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit
import QuartzCore

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
    
    fileprivate let transition = ModalAnimationController()
    fileprivate var presentStartCGRect = CGRect()
    fileprivate var presentCaptureView = UIImage()

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
        self.navigationController?.present(a2bVC, animated: true, completion: nil)
    }
    
}

extension AViewController {
    func tableViewTransformAnimation(_ tableView: UITableView, indexPath: IndexPath) {
        let rectOfCellInTableView = tableView.rectForRow(at: indexPath)
        presentStartCGRect = tableView.convert(rectOfCellInTableView, to: tableView.superview)
        let cellInTableView = tableView.cellForRow(at: indexPath)
        presentCaptureView = AViewController.captureImage(cellInTableView!)
    }
    
    static func captureImage(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

extension AViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionType = TransitionType.modalTransition(.present)
        transition.startingRect = presentStartCGRect
        transition.captureScreen = presentCaptureView
        return transition
    }
}

