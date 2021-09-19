//
//  FruitsTableViewController.swift
//  demoProjects
//
//  Created by apple on 18/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FruitsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
   
    
    @IBOutlet weak var buttonlabel: UIBarButtonItem!
    
    var fruitList = ["Mango", "Apple", "Orange"]
    
    @IBOutlet weak var fruitTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitList.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruitList[indexPath.row]
        //cell.buttonlabel.tag = indexPath.row
        cell
        
        return cell
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
 var newarray = ["DragonFruit", "Maskmelon", "Avacado", "Grapes", "Banana"]
    var newvalue : String = ""
    
    
    
    @IBAction func button_Tapped(_ sender: Any) {
        //  for index in newarray[0...newarray.count - 1] {
        //            newvalue = index
        //            print("\(newvalue)")
        //            fruitList.append(newarray[index])
        //
        //        /// not sure what the numbers mean though...
        //        fruitTable.beginUpdates()
        //        fruitTable.insertRows(at: [IndexPath(row: fruitList.count - 1, section: 0)], with: .automatic)
        //
        //        fruitTable.endUpdates()
        //       // fruitTable.reloadData()
            //}
                //or
                
               // self.loaddata()
                
                
              //to load new cell with data
               // fruitList.append("Strwaberry")
               // fruitTable.reloadData()
//        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewPopOver") as! DataPopViewController
//       // popController.delegate = self
//        popController.popoverPresentationController?.delegate = self
//
//                        // set the presentation style
//                        popController.modalPresentationStyle = UIModalPresentationStyle.popover
//
//                        // set up the popover presentation controller
//                        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.any
//                   popController.preferredContentSize.width = 300
//                                      popController.preferredContentSize.height = 300
//
//        popController.popoverPresentationController?.barButtonItem = buttonlabel
       // popController.view = self.view
        //popController.sourceView = self.view
        //popController.popoverPresentationController?.sourceRect = CGRect

                        // present the popover
                      //  self.present(popController, animated: true, completion: nil)
      
        
     
    }
    
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func button_clicked(_ sender: UIBarButtonItem) {
//              let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewPopOver") as! DataPopViewController
//               // popController.delegate = self
//                popController.popoverPresentationController?.delegate = self
//
//                                // set the presentation style
//                                popController.modalPresentationStyle = UIModalPresentationStyle.popover
//
//                                // set up the popover presentation controller
//                                popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.any
//                           popController.preferredContentSize.width = 300
//                                              popController.preferredContentSize.height = 300
//
//                popController.popoverPresentationController?.barButtonItem = sender
//                                self.present(popController, animated: true, completion: nil)
        textfield.addTarget(self, action:  #selector(textfieldupdate), for: .allEvents)
        self.loaddata()
    }
    
            // UIPopoverPresentationControllerDelegate method
            func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
                // Force popover style
                return UIModalPresentationStyle.none
            }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //fruitList.append(newvalue)
        loaddata()
        textfield.delegate = self as! UITextFieldDelegate
    }
    @objc func textfieldupdate () {
        newvalue = textfield.text!
    }
    //to load array of the values to the table view
    func loaddata()  {
              
        fruitList.append(newvalue)

                   fruitTable.reloadData()
    
}
}
