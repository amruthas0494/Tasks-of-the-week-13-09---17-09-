//
//  ViewController.swift
//  MySecondProject
//
//  Created by apple on 05/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var equation: UILabel!
    
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func ResetTapped(_ sender: Any) {
        equation.text = ""
        result.text = ""
        calculation = ""
    }
    
    var calculation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearTapped(_ sender: Any) {
        if(!calculation.isEmpty)
        {
            calculation.removeLast()
            equation.text = calculation
        }
    }
    
    
    
    @IBAction func modulusTapped(_ sender: Any) {
         calculateValues(value: "%")
    }
    
    
 
    
    @IBAction func divideTapped(_ sender: Any) {
        calculateValues(value: "/")
    }
    
    
    @IBAction func multiplyTapped(_ sender: Any) {
         calculateValues(value: "*")
    }
    
    
    
    @IBAction func minusTapped(_ sender: Any) {
         calculateValues(value: "-")
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
         calculateValues(value: "+")
    }
    
    
    @IBAction func sevenTapped(_ sender: Any) {
         calculateValues(value: "7")
    }
    
    @IBAction func eightTAPPED(_ sender: Any) {
         calculateValues(value: "8")
    }
    
    
    @IBAction func nineTapped(_ sender: Any) {
         calculateValues(value: "9")
    }
    
    
    
    
    @IBAction func Tapped(_ sender: Any) {
         calculateValues(value: "4")
    }
    
    
    @IBAction func fiveTapped(_ sender: Any) {
         calculateValues(value: "5")
    }
    
    
    @IBAction func sixTapped(_ sender: Any) {
         calculateValues(value: "6")
    }
    
    @IBAction func oneTapped(_ sender: Any) {
         calculateValues(value: "1")
    }
    
    
    @IBAction func twoTapped(_ sender: Any) {
         calculateValues(value: "2")
    }
    
    
    @IBAction func threeTapped(_ sender: Any) {
         calculateValues(value: "3")
    }
    
    
    @IBAction func zeroTapped(_ sender: Any) {
         calculateValues(value: "0")
    }
    
    @IBAction func dottapped(_ sender: Any) {
         calculateValues(value: ".")
    }
    
    
    @IBAction func equalsTapped(_ sender: Any) {
         let checkedWorkingsForPercent = calculation.replacingOccurrences(of: "%", with: "*0.01")
         let expression = NSExpression(format: checkedWorkingsForPercent)
         let calculateResult = expression.expressionValue(with: nil, context: nil) as! Double
         let resultString = formatResult(result: calculateResult)
         result.text = resultString
    }
    
    
}

extension ViewController {
    
    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in calculation
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == calculation.count - 1)
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
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    func calculateValues(value: String)
    {
        calculation = calculation + value
        equation.text = calculation
    }

    
}





