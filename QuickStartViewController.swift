//
//  QuickStartViewController.swift
//  MySecondProject
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class QuickStartViewController: UIViewController {

    
    
    @IBOutlet weak var displayLabel1: UILabel!
    
    @IBOutlet weak var displayLabel2: UILabel!
    
    
    @IBAction func setUpTapped(_ sender: UIButton) {
        let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toNetwork") as? NetworkConnectionViewController
               self.navigationController?.pushViewController(viewcontroller!, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.displayLabel1.text = "Bring your current iPhone or iPad near this iPhone to sign in and set up"
        self.displayLabel2.text = "If your other iPhone or iPad doesn’t show options for setting up this iPhone, make sure it’s running iOS 11 or later, and has Bluetooth turned on. You can also set up this iPhone manually"
    }
    


}
