//
//  ChatUIDesignTableViewCell.swift
//  MySecondProject
//
//  Created by apple on 05/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ChatUIDesignTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageDisplay: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
