//
//  LoginFirstViewController.swift
//  MySecondProject
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class LoginFirstViewController: UIViewController {

    
    @IBOutlet weak var language: UILabel!
    
    @IBOutlet weak var region: UILabel!
    
    
    @IBOutlet weak var network: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.language.text = currentLanguage
        self.region.text = currentRegion
        self.network.text = currentNetwork
    }
    

    
}
