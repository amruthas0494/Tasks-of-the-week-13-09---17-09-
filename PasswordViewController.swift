//
//  PasswordViewController.swift
//  MySecondProject
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    var givenPassword = "amrutha@123"
    
    @IBOutlet weak var enterPassword: UITextField!
    
    
    @IBAction func joinTapped(_ sender: Any) {
        if enterPassword.text == "" || enterPassword.text != givenPassword {
            let alert1 = UIAlertController(title: "Alert", message: "Inccorrect Passowrd", preferredStyle: .alert)
            let ok1 = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert1.addAction(ok1)
            self.present(alert1, animated: true, completion: nil)
        }
       if  enterPassword.text == givenPassword  {
        let alertController = UIAlertController(title: "Correct Password", message: " ", preferredStyle: .alert)
         self.present(alertController, animated: true, completion: nil)
        let OkAction = UIAlertAction(title: "SignIn", style: .default) { (action) in
            let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toFirstPage") as? LoginFirstViewController
            self.present(viewcontroller!, animated: true, completion: nil)
        }
        alertController.addAction(OkAction)
       
            
        }
    }
    
    
    @IBAction func canceltapped(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    

}
