//
//  DataPopViewController.swift
//  demoProjects
//
//  Created by apple on 19/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class DataPopViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    @IBOutlet weak var textFieldName: UITextField!
    var newName : String = ""
    
    @IBAction func Add_Clicked(_ sender: UIButton) {
        newName = self.textFieldName.text!
             print(newName)
  //performSegue(withIdentifier: "tobackVC", sender: AnyClass.self)
       
        
    }
    
    //var delegate:DataPopViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "tobackVC" {
            let newsegue = segue.destination as? FruitsTableViewController
            newsegue?.newvalue = newName
//            let pvc = newsegue?.popoverPresentationController
//            pvc?.delegate = self
//            return
            newsegue?.fruitList.append(newName)
            newsegue?.fruitTable!.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        return didReceiveMemoryWarning()
    }
    
}
