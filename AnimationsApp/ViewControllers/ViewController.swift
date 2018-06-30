//
//  ViewController.swift
//  AnimationsApp
//
//  Created by Jamie Randall on 5/1/18.
//  Copyright © 2018 Jamie Randall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
  
  
  
  @IBOutlet weak var button: UIButton!
  
  @IBAction func buttonPressed(_ sender: Any) {
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "presentPhotoController" {
      let toViewController = segue.destination as UIViewController
      toViewController.transitioningDelegate = self
    }
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return CustomPresentAnimator()
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return CustomDismissAnimator()
  }
  
  func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let customNavigationAnimator = CustomNavigationAnimator()
    
    if operation == .push {
      customNavigationAnimator.pushing = true
    }
    
    return customNavigationAnimator
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.delegate = self
    
    UIView.animate(withDuration: 2) {
      self.button.alpha = 1
    }
  }
  
}

