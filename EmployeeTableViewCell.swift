//
//  EmployeeTableViewCell.swift
//  MySecondProject
//
//  Created by apple on 11/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    
    
    @IBOutlet weak var idLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
