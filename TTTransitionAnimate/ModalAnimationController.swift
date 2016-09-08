//
//  ModalAnimationController.swift
//  TTTransitionAnimate
//  动画控制器
//  Created by 李亚坤 on 16/9/1.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

enum TransitionType{
//    case NavigationTransition(UINavigationControllerOperation)  // todo...
//    case TabTransition(TabOperationDirection)                   // todo...
    case ModalTransition(ModalOperation)
}

enum TabOperationDirection: Int{
    case Left, Right
}

enum ModalOperation: Int{
    case Present, Pop, Dismiss
}

public class ModalAnimationController: NSObject {
    
    /// bubble properties
    public private(set) var bubble = UIView()
    public var bubbleColor: UIColor = .whiteColor()
    public var startingPoint = CGPointZero {
        didSet {
            bubble.center = startingPoint
        }
    }
    
    private var transitionType: TransitionType
    
    init(type: TransitionType) {
        transitionType = type
        super.init()
    }
}

extension ModalAnimationController: UIViewControllerAnimatedTransitioning {
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView(),
                  fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
                  toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        else {
            return
        }
        
        let fromView = fromVC.view
        let toView = toVC.view
        
        // 让toView到屏幕的最下方
        let frame = transitionContext .initialFrameForViewController(fromVC)
        var offScreenFrame = frame
        offScreenFrame.origin.y = offScreenFrame.size.height
        toView.frame = offScreenFrame
        containerView.insertSubview(toView, aboveSubview: fromView)
        
        let t1 = self.fromViewTransform()
        let t2 = self.toViewTransform(fromView)
    
        switch transitionType {
        case .ModalTransition(let operation):
            switch operation {
            case .Present:
                    UIView .animateKeyframesWithDuration(1.0, delay: 0, options: .CalculationModeCubic, animations: {
                        
                        // 把fromView放到View后面
                        UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.4, animations: {
                            fromView.layer.transform = t1
                            fromView.alpha = 0.6
                        })
                        
                        // fromView第二个动画
                        UIView.addKeyframeWithRelativeStartTime(0.2, relativeDuration: 0.4, animations: {
                            fromView.layer.transform = t2
                        })
                        
                        // toView弹出动画
                        UIView.addKeyframeWithRelativeStartTime(0.8, relativeDuration: 0.2, animations: {
                            toView.frame = frame
                        })
                        
                        }, completion: { (finished) in
                            // 还原
                            fromView.transform = CGAffineTransformIdentity
                            fromView.alpha = 1.0
                            toView.transform = CGAffineTransformIdentity
                            
                            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    })
                
                break
            case .Pop: break
            case .Dismiss: break
            }
        }
        
        
    }
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }

}

private extension ModalAnimationController {
    func fromViewTransform() -> CATransform3D {
        var t1 = CATransform3DIdentity
        t1.m34 = 1.0 / -900
        t1 = CATransform3DScale(t1, 0.95, 0.95, 1)
        t1 = CATransform3DRotate(t1, 15.0 * CGFloat(M_PI/180.0), 1, 0, 0)
        return t1
    }
    
    func toViewTransform(view: UIView) -> CATransform3D {
        var t2 = CATransform3DIdentity
        t2.m34 = self.fromViewTransform().m34
        t2 = CATransform3DTranslate(t2, 0, view.frame.size.height * (-0.08), 0)
        t2 = CATransform3DScale(t2, 0.8, 0.8, 1)
        return t2
    }
    
    func frameForBubble(originalCenter: CGPoint, size originalSize: CGSize, start: CGPoint) -> CGRect {
        let lengthX = fmax(start.x, originalSize.width - start.x);
        let lengthY = fmax(start.y, originalSize.height - start.y)
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2;
        let size = CGSize(width: offset, height: offset)
        
        return CGRect(origin: CGPointZero, size: size)
    }
}

