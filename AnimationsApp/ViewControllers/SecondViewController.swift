//
//  SecondViewController.swift
//  AnimationsApp
//
//  Created by Jamie Randall on 5/1/18.
//  Copyright © 2018 Jamie Randall. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  var startAppBanner: STABannerView?
  @IBOutlet weak var dismissButton: UIButton!
  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
  @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
  
  @IBAction func dismissButtonTapped(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imgView.isUserInteractionEnabled = true
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
    
    imgView.gestureRecognizers = [tapGesture]
    
    if navigationController != nil {
      dismissButton.isHidden = true
    }

  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if (startAppBanner == nil) {
      startAppBanner = STABannerView(size: STA_AutoAdSize, autoOrigin: STAAdOrigin_Bottom, with: self.view, withDelegate: nil);
      self.view.addSubview(startAppBanner!)
    }
  }
  
  @objc func handleTap(recognizer: UITapGestureRecognizer) {
    
    print("hello world was tapped!")
    
    UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.calculationModeCubic], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
        self.leadingConstraint.constant  = 40
        self.trailingConstraint.constant = 0
        self.view.layoutIfNeeded()
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.4, animations: {
        self.leadingConstraint.constant  = 0
        self.trailingConstraint.constant = 40
        self.view.layoutIfNeeded()
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
        self.leadingConstraint.constant  = 16
        self.trailingConstraint.constant = 16
        self.view.layoutIfNeeded()
      })
    }, completion: nil)
    
  }
  
  
  func viewControllerForPresentingModalView() -> UIViewController? {
    return self
  }
}

