//
//  MyViewCell.swift
//  UIPageViewControllerDemo
//
//  Created by projas on 7/13/16.
//  Copyright © 2016 nearsoft. All rights reserved.
//

import UIKit

class MyViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  static func reuseIdentifier() -> String{
    return "MyViewCell"
  }
    
}
