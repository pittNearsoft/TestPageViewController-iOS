//
//  TutorialPageViewController.swift
//  UIPageViewControllerDemo
//
//  Created by projas on 7/13/16.
//  Copyright © 2016 nearsoft. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
  
  private var orderedViewControllers: [UIViewController] = []
  private var currentIndex = 0
  var pageDelegate: TutorialPageViewControllerDelegate?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.dataSource = self
    self.delegate = self
    
    orderedViewControllers.append(newViewControllerWithPrefix("MyTable"))
    orderedViewControllers.append(newViewControllerWithPrefix("MyTable"))
    orderedViewControllers.append(newViewControllerWithPrefix("MyTable"))
    
    if let firstVC = orderedViewControllers.first {
      setViewControllers([customViewController(firstVC)], direction: .Forward, animated: false, completion: nil)
    }
    
    
    
  }
  
  private func newViewControllerWithPrefix(prefix: String) -> UIViewController{
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("\(prefix)ViewController")
  }
  
  func customViewController(viewController: UIViewController) -> UIViewController {
    let customVC = viewController as! MyTableViewController
    customVC.numberOfElements = orderedViewControllers.indexOf(viewController)! + 3
    
    
    return customVC
  }
  
  func moveToPageWithIndex(index: Int) {
    
    let direction: UIPageViewControllerNavigationDirection = (currentIndex < index) ? .Forward : .Reverse
    
    if direction == .Forward {
      while currentIndex < index {
        currentIndex += 1
        setViewControllers([customViewController(orderedViewControllers[currentIndex])], direction: direction, animated: true, completion: nil)
        
      }
    }else if direction == .Reverse{
      while currentIndex > index {
        currentIndex -= 1
        setViewControllers([customViewController(orderedViewControllers[currentIndex])], direction: direction, animated: true, completion: nil)
        
      }
    }
  }

  
}



extension TutorialPageViewController: UIPageViewControllerDataSource{
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
      return nil
    }
    
    let previousIndex = viewControllerIndex - 1
    
    guard previousIndex >= 0 else {
      return nil
    }
    
    guard orderedViewControllers.count > previousIndex else {
      return nil
    }
    
    
    return customViewController(orderedViewControllers[previousIndex])//orderedViewControllers[previousIndex]
    
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else{
      return nil
    }
    
    let nextIndex = viewControllerIndex + 1
    let orderedViewControllersCount = orderedViewControllers.count
    
    guard orderedViewControllersCount > nextIndex else {
      return nil
    }
    

    return customViewController(orderedViewControllers[nextIndex])//orderedViewControllers[nextIndex]
  }
  
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return orderedViewControllers.count
  }
  
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    guard let firstViewController = viewControllers?.first,
      firstViewControllerIndex = orderedViewControllers.indexOf(firstViewController) else{
        return 0
    }
    
    return firstViewControllerIndex
  }
  
  
}

extension TutorialPageViewController: UIPageViewControllerDelegate{
  func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    
    let currentVC = pageViewController.viewControllers?.last
    currentIndex = orderedViewControllers.indexOf(currentVC!)!
    
    pageDelegate?.didChangePageWithIndex(currentIndex)
  }
}

protocol TutorialPageViewControllerDelegate {
  func didChangePageWithIndex(index: Int)
}
