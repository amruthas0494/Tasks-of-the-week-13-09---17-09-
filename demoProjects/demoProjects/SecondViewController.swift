//
//  SecondViewController.swift
//  demoProjects
//
//  Created by apple on 18/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    var labeldata :String = ""
    
    var labe2 = "Color changed to green"
    var delegate: changeView?
    
    @IBAction func notify_Tapped(_ sender: UIButton) {
        
        self.delegate?.viewDisplay()
        self.navigationController?.popViewController(animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = labeldata
       
    }
    
    

   

}
