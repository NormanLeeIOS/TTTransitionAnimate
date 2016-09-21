//
//  TabBarController.swift
//  TTTransitionAnimate
//
//  Created by 李亚坤 on 16/8/12.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    fileprivate static let shareInstance = TabBarController()
    class var shareTab: TabBarController {
        return shareInstance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let firstVC = AViewController()
        let firstNavi = ANavigationViewController(rootViewController: firstVC)
        firstNavi.viewControllers = [firstVC]
        
        let secondVC = BViewController()
        let secondNavi = BNavigationViewController(rootViewController: secondVC)
        secondNavi.viewControllers = [secondVC]
        
        self.viewControllers = [firstNavi, secondNavi]
        
        UITabBar.appearance().tintColor = UIColor.red
        
        let firstBar = self.tabBar.items![0]
        firstBar.title = "首页"
        
        let secondBar = self.tabBar.items![1]
        secondBar.title = "发现"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
