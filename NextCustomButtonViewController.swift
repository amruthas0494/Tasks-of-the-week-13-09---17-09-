//
//  NextCustomButtonViewController.swift
//  MySecondProject
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
protocol eventHandle {
    func ChangeCellValue()
}

class NextCustomButtonViewController: UIViewController {

    var callBackHandler : (() -> Void)?
    var delegate : eventHandle?
    
    var rows: Int?
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        
        self.callBackHandler?()
        
        //self.delegate?.ChangeCellValue()
        
         self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
