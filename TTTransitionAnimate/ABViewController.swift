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
        
        self.view.backgroundColor = UIColor.white
        backBtn = UIButton(frame: CGRect(x: 10, y: 0, width: self.view.frame.width - 20, height: 40))
        backBtn.setTitle("this is a textLabel this is a detailTextLabel", for: UIControlState())
        backBtn.setTitleColor(UIColor.black, for: UIControlState())
        backBtn.addTarget(self, action: #selector(ABViewController.back), for: .touchUpInside)
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
