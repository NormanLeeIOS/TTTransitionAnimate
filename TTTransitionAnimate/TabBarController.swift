//
//  TabBarController.swift
//  TTTransitionAnimate
//
//  Created by 李亚坤 on 16/8/12.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private static let shareInstance = TabBarController()
    class var shareTab: TabBarController {
        return shareInstance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        let firstVC = AViewController()
        let firstNavi = ANavigationViewController()
        firstNavi.viewControllers = [firstVC]
        
        let secondVC = BViewController()
        let secondNavi = BNavigationViewController()
        secondNavi.viewControllers = [secondVC]
        
        self.viewControllers = [firstVC, secondVC]
        
        UITabBar.appearance().tintColor = UIColor.redColor()
        
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
