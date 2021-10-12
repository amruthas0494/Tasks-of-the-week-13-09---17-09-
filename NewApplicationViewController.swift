//
//  NewApplicationViewController.swift
//  MySecondProject
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class NewApplicationViewController: UIViewController {

    
    @IBAction func getStartedTapped(_ sender: UIButton) {
        let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toLanguageVC") as? LanguageSettingViewController
        self.navigationController?.pushViewController(viewcontroller!, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}
