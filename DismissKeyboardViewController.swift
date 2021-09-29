//
//  DismissKeyboardViewController.swift
//  MyFirstProject
//
//  Created by apple on 29/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class DismissKeyboardViewController: UIViewController {

    @IBOutlet weak var addText: UITextField!
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func doneTapped(_ sender: Any) {

       // Looks for single or multiple taps.
      /*  let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
                //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
                //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
         */
        displayLabel.text = addText.text
        self.addText.endEditing(true)
        addText.text = ""
        addText.isEnabled = false
        }
       /*
        func dismissKeyboard(){ /*this is a void function*/
        addText.resignFirstResponder() /*This will dismiss our keyboard on tap*/
        }
            
           //Calls this function when the tap is recognized.
        @objc func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        }
        */
    
    
    
    @IBAction func editTextTapped(_ sender: Any) {
        addText.isEnabled = true
       
    }
    
   //UITapGestureRecognizer - sends action message when the user taps. A tap gesture recognizer can be configured for single or multiple taps, with single or multiple touches.
    @IBAction func tapGestureWhenDone(_ sender: UITapGestureRecognizer) {
        
        var newValue = addText.text!
        displayLabel.text = newValue
        self.addText.resignFirstResponder()
        addText.text = ""
    }
    
    
}
