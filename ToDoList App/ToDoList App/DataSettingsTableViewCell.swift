//
//  DataSettingsTableViewCell.swift
//  ToDoList App
//
//  Created by apple on 22/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class DataSettingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var displayImage: UIImageView!
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBOutlet weak var displaylabel1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
