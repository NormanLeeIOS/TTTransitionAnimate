//
//  ABViewController.swift
//  TTTransitionAnimate
//
//  Created by 李亚坤 on 16/8/15.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

class ABViewController: UIViewController {

    var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue
        
        backBtn = UIButton(frame: CGRect(x: self.view.frame.width/2 - 50, y: self.view.frame.height/2 - 25, width: 100, height: 50))
        backBtn.setTitle("后退", for: UIControlState())
        backBtn.addTarget(self, action: #selector(ABViewController.back), for: .touchUpInside)
        backBtn.backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        self.view.addSubview(backBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }

}
