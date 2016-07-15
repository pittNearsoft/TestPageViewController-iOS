//
//  EventsViewController.swift
//  UIPageViewControllerDemo
//
//  Created by projas on 7/13/16.
//  Copyright © 2016 nearsoft. All rights reserved.
//

import UIKit
import NPSegmentedControl

class EventsViewController: UIViewController {
  
  @IBOutlet weak var menuSelector: NPSegmentedControl!
  private var pageVC: TutorialPageViewController!
  let menuElements = ["Upcoming", "Popular", "My Events"]
  let mainColor = UIColor(red: 10/255, green: 137/255, blue: 169/255, alpha: 1)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    menuSelector.backgroundColor = UIColor.whiteColor()
    menuSelector.cursor = UIImageView(image: UIImage(named: "tabindicator"))
    
    menuSelector.unselectedFont = UIFont(name: "HelveticaNeue-Light", size: 16)
    menuSelector.selectedFont = UIFont(name: "HelveticaNeue-Bold", size: 16)
    menuSelector.unselectedTextColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)//UIColor(white: 1, alpha: 0.8)
    menuSelector.unselectedColor = mainColor.colorWithAlphaComponent(0.8)//UIColor(red: 10/255, green: 137/255, blue: 169/255, alpha: 0.8)
    menuSelector.selectedTextColor = UIColor.whiteColor()
    menuSelector.selectedColor = mainColor
    menuSelector.cursorPosition = CursorPosition.Bottom
    
    menuSelector.setItems(menuElements)
    
    customizeNavigationBar()
    customizeTabBar()
  }
  
  func customizeNavigationBar() {
    self.navigationController?.navigationBar.tintColor = mainColor
    self.navigationController?.navigationBar.barTintColor = mainColor
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    removerBordersFromNavigationBar()
  }
  
  func customizeTabBar() {
    self.tabBarController?.tabBar.barTintColor = mainColor
    self.tabBarController?.tabBar.tintColor = UIColor.whiteColor()
    
  }
  
  func removerBordersFromNavigationBar() {
    for parent in self.navigationController!.navigationBar.subviews {
      for childView in parent.subviews {
        if(childView is UIImageView) {
          childView.removeFromSuperview()
        }
      }
    }
  }
  
  
  @IBAction func selectorValueChanged(sender: AnyObject) {
    pageVC.moveToPageWithIndex(menuSelector.selectedIndex())
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "eventListSegue" {
      pageVC = segue.destinationViewController as! TutorialPageViewController
      pageVC.pageDelegate = self
    }
  }

}

extension EventsViewController: TutorialPageViewControllerDelegate{
  func didChangePageWithIndex(index: Int) {
    menuSelector.selectCell(index, animate: true)
  }
}
