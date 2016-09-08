//
//  ModalTransitionDelegate.swift
//  TTTransitionAnimate
//  转场代理协议类
//  Created by 李亚坤 on 16/9/1.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

class ModalTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    // 实现协议方法
    static func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transitionType = TransitionType.ModalTransition(.Present)
        return ModalAnimationController(type: transitionType)
    }
}
