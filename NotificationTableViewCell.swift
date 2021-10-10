//
//  NotificationTableViewCell.swift
//  MySecondProject
//
//  Created by apple on 10/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var displayL1: UILabel!
    
    @IBOutlet weak var displayL2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
