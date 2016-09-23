//
//  ModalAnimationController.swift
//  TTTransitionAnimate
//  动画控制器
//  Created by 李亚坤 on 16/9/1.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

public enum TransitionType{
//    case NavigationTransition(UINavigationControllerOperation)  // todo...
//    case TabTransition(TabOperationDirection)                   // todo...
    case modalTransition(ModalOperation)
}

public enum TabOperationDirection: Int{
    case left, right
}

public enum ModalOperation: Int{
    case present, pop, dismiss
}

open class ModalAnimationController: NSObject {
    
    /// bubble properties
    open fileprivate(set) var bubble = UIView()
    open var bubbleColor = UIColor.white
    open var captureScreen = UIImage()
    open var startingRect = CGRect() {
        didSet {
            bubble.frame = startingRect;
            bubble.center = CGPoint(x: startingRect.midX, y: startingRect.midY)
        }
    }
    
    open var transitionType: TransitionType = TransitionType.modalTransition(ModalOperation.present)
    
    override init() {
        super.init()
    }
}

extension ModalAnimationController: UIViewControllerAnimatedTransitioning {
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
              let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        else {
            return
        }
        
        let containerView = transitionContext.containerView
        let fromView = fromVC.view
        let toView = toVC.view
    
        // 设置bubble效果
        toView?.frame = startingRect
        toView?.clipsToBounds = true

        
        containerView.insertSubview(toView!, aboveSubview: fromView!)
        
        let frame = transitionContext .initialFrame(for: fromVC)
        let t1 = self.fromViewTransform()
    
        switch transitionType {
        case .modalTransition(let operation):
            switch operation {
            case .present:
                    UIView .animateKeyframes(withDuration: 1.0, delay: 0, options: .calculationModeCubic, animations: {
                        
                        // 把fromView放到View后面
                        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4, animations: {
                            fromView?.layer.transform = t1
                            fromView?.alpha = 0.6
                        })
                        
                        // toView弹出动画
                        UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                            toView?.frame = frame
                        })
                        
                        }, completion: { (finished) in
                            // fromView还原
                            fromView?.transform = CGAffineTransform.identity
                            fromView?.alpha = 1
                            
                            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                    })
                
                break
            case .pop: break
            case .dismiss: break
            }
        }
        
        
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

}

private extension ModalAnimationController {
    func fromViewTransform() -> CATransform3D {
        var t1 = CATransform3DIdentity
        t1 = CATransform3DScale(t1, 0.9, 0.9, 1)
        return t1
    }
    
    func frameForBubble(_ originalCenter: CGPoint, size originalSize: CGSize, start: CGPoint) -> CGRect {
        let lengthX = fmax(start.x, originalSize.width - start.x);
        let lengthY = fmax(start.y, originalSize.height - start.y)
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2;
        let size = CGSize(width: offset, height: offset)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
}

