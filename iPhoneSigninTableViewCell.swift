//
//  iPhoneSigninTableViewCell.swift
//  MyFirstProject
//
//  Created by apple on 01/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class iPhoneSigninTableViewCell: UITableViewCell {

    @IBOutlet weak var profile: UIImageView!
    
    @IBOutlet weak var signInlabel: UILabel!
    
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
