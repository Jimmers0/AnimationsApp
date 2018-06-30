//
//  CustomDismissAnimator.swift
//  AnimationsApp
//
//  Created by Jamie Randall on 5/4/18.
//  Copyright © 2018 Jamie Randall. All rights reserved.
//

import Foundation
import UIKit

class CustomDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 1
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
      let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else {
        return
    }
    
    var fromViewControllerEndFrame = fromViewController.view.frame
    fromViewControllerEndFrame.origin.y -= UIScreen.main.bounds.height
    
    transitionContext.containerView.addSubview(toViewController.view)
    transitionContext.containerView.sendSubview(toBack: toViewController.view)
    
    UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
      fromViewController.view.frame = fromViewControllerEndFrame
      toViewController.view.alpha = 1
    }, completion: {
      completed in
      transitionContext.completeTransition(true)
    })
  }
}
