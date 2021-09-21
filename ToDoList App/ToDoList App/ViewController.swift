//
//  ViewController.swift
//  ToDoList App
//
//  Created by apple on 20/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit


class ViewController: UIViewController{

 
    var cars : [ToDoList] = []
    
    var rowCarName : String?
    var rowCarBrand : String?
    
    var button : UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func AddCell(_ sender: Any) {
       
    
        let alert = UIAlertController(title: "Add  Car Details", message: " Please fill the text fields", preferredStyle: .alert)
        alert.addTextField { (textfield1) in
            textfield1.placeholder = "Car Name"
        }
        alert.addTextField { (textfield2) in
            textfield2.placeholder = "Brand Name"
        }
        let alertok = UIAlertAction(title: "OK", style: .default) { (action) in
            if  let carName = alert.textFields?.first?.text, let brandName = alert.textFields?.last?.text{
                
            if (carName != ""), (brandName != "") {
            let showroom = ToDoList(name: carName, brand: brandName)
            self.cars.append(showroom)
            self.tableview.reloadData()
            }
            else {
                let alert1 = UIAlertController(title: "Error", message: " Please fill all the  fields", preferredStyle: .alert)
                let ok1 = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert1.addAction(ok1)
                self.present(alert1, animated: true, completion: nil)
                }
        }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(alertok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var editbutton: UIBarButtonItem!
    @IBAction func edit_Clicked(_ sender: Any) {
        
//       // tableview.addSubview(button)
//        for cell in tableview.visibleCells {
//
//
//        }
        
        
    }
    
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
        
      
        
        for cell in tableview.visibleCells{
            cell.addSubview(button)
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "To Do List"
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        button = UIButton()
        button.frame.origin.x = 0
        button.frame.origin.y = 0
        button.frame.size.width = 50
        button.frame.size.height = 50
        button.setTitle("Remove", for: .normal)
        button.setImage(UIImage(named: "images.png"), for: .normal)
        button.backgroundColor = .systemRed
        
        
    }


}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cars.count == 0 {
            let message = UIAlertController(title: "Alert", message: "Table is empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            message.addAction(ok)
            present(message, animated: true, completion: nil)
        }
        
        return cars.count
    }
     // configuration of the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath)
        cell.textLabel?.text = cars[indexPath.row].name
        cell.detailTextLabel?.text = cars[indexPath.row].brand
        cell.editingAccessoryView = view
        
        rowCarName = cars[indexPath.row].name
        rowCarBrand = cars[indexPath.row].brand
       
        
        return cell
    }
    
    
    
}
extension ViewController : UITableViewDelegate {
//to perform action when swiped as edit style delete
    
   /* func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if editingStyle == .delete {
            cars.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()

        }

             }
*/
    
  //executing this method to edit the cell  and return true allows editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    //  declaring custom actions for our swiped cell
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

           // declaring Delete action when swiped cell
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
                let index = indexPath.row
               //  Delete button execution
               // removing city from the list of array (in backend)
               self.cars.remove(at: index)
               
               // removing cell from the tableView (in frontend)
             tableView.deleteRows(at: [indexPath], with: .fade)
                       tableView.reloadData()
                       
           }
            deleteAction.backgroundColor = .red
    
           // declaring Edit when swiped cell
           let editAction = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction1, view1, boolValue1) in
         let alertcontroller = UIAlertController(title: "Update", message: "You can update the values", preferredStyle: .alert)
            
                    alertcontroller.addTextField { (textfieldcar) in
                        textfieldcar.placeholder = "Update car Name"
                    }
                    alertcontroller.addTextField { (textfieldbrand) in
                        textfieldbrand.placeholder = "Update Brand Name"
                    }
            
            
                    let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                        //assigning textfield values added in alert to the perticular index row
                        //updating values
                        let updatedcarValue = alertcontroller.textFields?.first?.text
                        let updatedbrandvalue =  alertcontroller.textFields?.last?.text

                        self.rowCarName = updatedcarValue
                        self.rowCarBrand = updatedbrandvalue
                            print(self.rowCarName!)
                      print(self.rowCarBrand!)
                        // checking if the fields and empty
                        if updatedcarValue == "" && updatedbrandvalue == ""  {
                                                   let updateAlert = UIAlertController(title: "Error Message", message: "Please fill the text fields", preferredStyle: .alert)
                                                   let updateok = UIAlertAction(title: "OK", style: .default) { (action) in
                                                      
                                                   }
                            updateAlert.addAction(updateok)
                                                           self.present(updateAlert, animated: true, completion: nil)
                        }
                       else {
                   //updating the values of the todo list structure
                        let showroom = ToDoList(name: self.rowCarName, brand: self.rowCarBrand)
                        //updating the new values to the array of  type todolist
                        self.cars[indexPath.row] = showroom
                      
                        self.tableview.reloadData()
                        }
                        
                           
                            
                        }
          
               
           
            // close the cellafter updating values
                      tableView.setEditing(false, animated: true)
            alertcontroller.addAction(ok)
            self.present(alertcontroller, animated: true, completion: nil)
            
            
            }
            
           
           // assigning custom color to action's appearance
            editAction.backgroundColor = .green
            
           
           return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
           
       }
       
       
    //cannot use the method editActions for iOS13 and above
/*    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let deleteACtion = UITableViewRowAction(style: .default, title: "Delete") { (action: UITableViewRowAction, index: IndexPath) in
            self.cars.remove(at: index.row)
            tableView.deleteRows(at: [index], with: .fade)
            tableView.reloadData()
            print("Deleted")
        }
        deleteACtion.backgroundColor = .red


        let editAction = UITableViewRowAction(style: .default, title: "Edit") { (action:UITableViewRowAction, index : IndexPath) in
            let alertcontroller = UIAlertController(title: "Update Row", message: "Please update the values", preferredStyle: .alert)
            alertcontroller.addTextField { (textfield1) in
                textfield1.placeholder = "Update car Name"
            }
            alertcontroller.addTextField { (textfield2) in
                textfield2.placeholder = "Update Brand Name"
            }
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                let updateName = alertcontroller.textFields?.first?.text
                let updatebrand = alertcontroller.textFields?.last?.text

                let showroom = ToDoList(name: updateName, brand: updateName)
                self.cars.append(showroom)
                self.tableview.reloadData()

              }
        }
              editAction.backgroundColor = .green

     return [deleteACtion, editAction]
  }
*/

    
    
}

