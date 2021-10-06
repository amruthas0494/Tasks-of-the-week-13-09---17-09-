//
//  CalculatorAppViewController.swift
//  MySecondProject
//
//  Created by apple on 05/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CalculatorAppViewController: UIViewController {

     var calculation: String = ""
    @IBOutlet weak var equation: UILabel!
    
    @IBOutlet weak var displayResult: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var isChosen: Bool = false
    var operation: [String] = []
    var screenSize: CGRect!
       var screenWidth: CGFloat!
       var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
       // collectionView.delegate = self
        

        operation = ["AC","+/-", "%", "/", "7", "8", "9",  "*", "4", "5", "6", "-", "1",  "2", "3", "+", "0", ".", "X","="]
       // collectionView?.contentInsetAdjustmentBehavior = .always
        
        screenSize = UIScreen.main.bounds
               screenWidth = screenSize.width
               screenHeight = screenSize.height
        // Do any additional setup after loading the view, typically from a nib.
               let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: 25, left: 0, bottom: 25, right: 0)
               layout.itemSize = CGSize(width: screenWidth/4, height: screenWidth/4)
               layout.minimumInteritemSpacing = 0
               layout.minimumLineSpacing = 0
               collectionView!.collectionViewLayout = layout
    }
    
   

}

extension CalculatorAppViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return operation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! CalculatorCollectionViewCell
        cell.buttonLabel.setTitle(operation[indexPath.item], for: .normal)
        cell.buttonLabel.layer.masksToBounds = false
        cell.buttonLabel.layer.borderColor = UIColor.black.cgColor
        cell.buttonLabel.layer.cornerRadius = cell.buttonLabel.frame.height/2
        switch cell.buttonLabel.currentTitle {
        case "AC", "+/-", "%":
               cell.buttonLabel.backgroundColor = .systemGray2
           
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "X":
                cell.buttonLabel.backgroundColor = .systemGray
            
        case "+", "-", "/", "*", "=":
                cell.buttonLabel.backgroundColor = .systemPink
        default:
            print("Color is Not set")

        }
 cell.buttonLabel.tag = indexPath.item
        cell.buttonLabel.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return cell
    }
   
}

extension CalculatorAppViewController {
    
    @objc func buttonTapped(sender : UIButton) {

        let tag = sender.tag
        print(tag)
        
        isChosen = true
        if tag == 0 {
            calculation.removeAll()
            equation.text?.removeAll()
            displayResult.text = ""
        }
        else if tag == 1 {
            calculateValues(value: "+")

        } else if tag == 2 {
                calculateValues(value: "%")
        }
        else if tag == 3 {
                calculateValues(value: "/")
        }
        else if tag == 4 {
                calculateValues(value: "7")
        }
        else if tag == 5 {
                calculateValues(value: "8")
        }
    
        else if tag == 6 {
            calculateValues(value: "9")

        } else if tag == 7 {
                calculateValues(value: "*")
        }
        else if tag == 8 {
                calculateValues(value: "4")
        }
        else if tag == 9 {
                calculateValues(value: "5")
        }
        else if tag == 10 {
                calculateValues(value: "6")
        }
        else if tag == 11 {
                calculateValues(value: "-")

        }
        else if tag == 12 {
                calculateValues(value: "1")
        }
        else if tag == 13 {
                calculateValues(value: "2")
        }
        else if tag == 14 {
                calculateValues(value: "3")
        }
        else if tag == 15 {
                calculateValues(value: "+")
        }
           
        else if tag == 16 {
                calculateValues(value: "0")

        } else if tag == 17 {
                calculateValues(value: ".")
        }else if tag == 18 {
                if(!calculation.isEmpty)
                {
                    calculation.removeLast()
                    equation.text = calculation
                }
        }
        else if tag == 19 {
                let checkedWorkingsForPercent = calculation.replacingOccurrences(of: "%", with: "*0.01")
                let expression = NSExpression(format: checkedWorkingsForPercent)
                let calculateResult = expression.expressionValue(with: nil, context: nil) as! Double
                let resultString = formatResult(result: calculateResult)
                displayResult.text = resultString
            equation.text = ""
        }
       
        isChosen = !isChosen

       }
    
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
