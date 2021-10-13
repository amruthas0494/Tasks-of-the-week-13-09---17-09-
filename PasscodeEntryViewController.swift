//
//  PasscodeEntryViewController.swift
//  MySecondProject
//
//  Created by apple on 13/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import SimplePasscodeView

class PasscodeEntryViewController: UIViewController {
   
    var mypasscode = "1234"
    
    @IBOutlet  weak  var passcode: SimplePasscodeView!
    override func viewDidLoad() {
    super.viewDidLoad()
        passcode.delegate = self
        passcode.isSecureEntry = true
        passcode.length = 4
        passcode.defaultSpacing = 10.0
        passcode.keyboardType = .numberPad
        passcode.pinborderColor = UIColor.white.cgColor
        passcode.pinfillColor = UIColor.white
    }
    }

extension PasscodeEntryViewController: SimplePasscodeDelegate {
    func didDeleteBackward() {
        print("Yes")
    }
    
   
    
    func didFinishEntering(_ passcode: String) {
        if passcode != mypasscode {
     print("passcode: \(passcode)")
           let alert = UIAlertController(title: "Passcode", message: "Incorrect", preferredStyle: .alert)
           let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
           alert.addAction(alertAction)
           present(alert, animated: true, completion: nil)
            self.passcode.pinfillColor = .clear
    }
        if passcode == mypasscode {
            let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toWelcome") as? WelcomPasscodeViewController
            self.present(viewcontroller!, animated: true, completion: nil)
            self.navigationController?.pushViewController(viewcontroller!, animated: true)
        }
   
    
  
   

}
}
