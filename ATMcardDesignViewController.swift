//
//  ATMcardDesignViewController.swift
//  MyFirstProject
//
//  Created by apple on 28/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ATMcardDesignViewController: UIViewController {
    

    
    @IBOutlet var tapgesture: UITapGestureRecognizer!
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var stackview: UIStackView!
    
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var textfield2: UITextField!
    
    @IBOutlet weak var textfield3: UITextField!
    
    
    @IBOutlet weak var textfield4: UITextField!
    
    
    
    @IBOutlet weak var calculateText: UITextField!
    
    
    @IBOutlet weak var displayResult: UILabel!
    var calculate: String = ""
    
//    func ClearAll() {
//        calculate = ""
//        calculateText.text = ""
//        //ClearAll()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //ClearAll()
        // self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
    }
    
    
    //performing calculation
   /* func performMath() -> Float {
        calculate = calculateText.text!
        let expression = NSExpression(format: calculate)
        let result = expression.expressionValue(with: nil, context: nil) as! Float
        return result
    } */
    
    
    @IBOutlet weak var enterData: UITextField!
    
    @IBOutlet weak var displayData: UILabel!
    
    
    @IBAction func tapgesture(_ sender: UITapGestureRecognizer) {
        var newValue = enterData.text!
        displayData.text = newValue
        self.enterData.resignFirstResponder()
    }
    
    
 
}

extension ATMcardDesignViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //task 1 : sing textfield delegate and updateing card number
        if (textField == textfield1) {
        let text1 = textfield1.text ?? ""
        self.label1.text = text1
        self.textfield1.text = ""
       textfield1.resignFirstResponder()
        }
        else if (textField == textfield2) {
        let text2 = textfield2.text ?? ""
        self.label2.text = text2
        self.textfield2.text = ""
        textfield2.resignFirstResponder()
        }
        else if (textField == textfield3) {
        let text3 = textfield3.text ?? ""
        self.label3.text = text3
        self.textfield3.text = ""
        textfield3.resignFirstResponder()
        }
            
        else if (textField == textfield4) {
        let text4 = textfield4.text ?? ""
        self.label4.text = text4
        self.textfield4.text = ""
        textfield4.resignFirstResponder()
        }
       
       /* let text1 = textfield1.text ?? ""
        self.label1.text = text1
        self.textfield1.text = ""
        textfield1.resignFirstResponder()
           
         
           let text2 = textfield2.text ?? ""
           self.label2.text = text2
           self.textfield2.text = ""
           textfield2.resignFirstResponder()
           
      
           let text3 = textfield3.text ?? ""
           self.label3.text = text3
           self.textfield3.text = ""
           textfield3.resignFirstResponder()
           
               
         
           let text4 = textfield4.text ?? ""
           self.label4.text = text4
           self.textfield4.text = ""
           textfield4.resignFirstResponder()
           */
            
         if (textField == calculateText){
        //task3 : Calculating expression or calculator coding
        let calculate = calculateText.text!
        let expression = NSExpression(format: calculate)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        self.displayResult.text = resultString
        self.calculateText.text = ""
        textField.endEditing(true)
//        self.label2.text = text
//         self.label3.text = text
//         self.label4.text = text
        }
        
        return true
        
    }
    

    
    // method to check given input is valid
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        //checking for each characteer and if there is special character then appending it to the new array
        for char in calculate
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        //for the newly created array
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == calculate.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    //method for the speacial charaters checking
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        if(char == "-")
        {
            return true
        }
        if(char == "%")
        {
            return true
        }
        return false
    }
    
    //method to format the result that return string
    func formatResult(result: Double) -> String
    {
        //if 
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
}

