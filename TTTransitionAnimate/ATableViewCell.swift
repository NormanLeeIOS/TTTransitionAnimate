//
//  ATableViewCell.swift
//  TTTransitionAnimate
//
//  Created by 李亚坤 on 16/8/12.
//  Copyright © 2016年 NormanLeeIOS. All rights reserved.
//

import UIKit

class ATableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.text = "this is a textLabel"
        self.detailTextLabel?.text = "this is a detailTextLabel..."
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
