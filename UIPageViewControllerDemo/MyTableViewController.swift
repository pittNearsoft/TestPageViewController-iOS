//
//  MyTableViewController.swift
//  UIPageViewControllerDemo
//
//  Created by projas on 7/13/16.
//  Copyright © 2016 nearsoft. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
  
  var numberOfElements = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nibName = UINib(nibName: MyViewCell.reuseIdentifier(), bundle:nil)
    tableView.registerNib(nibName, forCellReuseIdentifier: MyViewCell.reuseIdentifier())
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 66 //104.0
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfElements
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MyViewCell", forIndexPath: indexPath) as! MyViewCell
    
    cell.backgroundColor = (indexPath.row%2==0) ? UIColor.whiteColor() : UIColor ( red: 0.9095, green: 0.9095, blue: 0.9095, alpha: 1.0 )
    
    return cell
  }
  
  
  
  
  
}
