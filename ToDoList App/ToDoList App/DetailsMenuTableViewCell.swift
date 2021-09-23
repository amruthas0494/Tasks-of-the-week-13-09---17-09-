//
//  DetailsMenuTableViewCell.swift
//  ToDoList App
//
//  Created by apple on 22/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class DetailsMenuTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var prizeLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
