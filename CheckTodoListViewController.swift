//
//  CheckTodoListViewController.swift
//  MySecondProject
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import CoreData


class CheckTodoListViewController: UIViewController {

    /* var newData : [Names] = []
    var storeData : [String]  = []
     var storeData1 : [Names]  = []
    var counter = 0 */

   var nameModel = NamesList()
  
     var storeData : [String]  = []
    @IBOutlet weak var namesTable: UITableView!
    
    @IBAction func addItemTapped(_ sender: Any) {
        //counter = counter + 1
        let alert = UIAlertController(title: "Add New To-Do Item", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Create new Item"
        }
              let ok = UIAlertAction(title: "Add Item", style: .default) { (action) in
                if let pName = alert.textFields?.first?.text {
                    if pName != "" {
                    if  self.nameModel.validateNames(uName: pName){
                        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
                            return
                        }
                        let managedObject = appdelegate.persistentContainer.viewContext
                        if let entity = NSEntityDescription.entity(forEntityName: "Userdata", in: managedObject) {
                            if let person = NSManagedObject(entity: entity, insertInto: managedObject) as? Userdata {
                                person.name = pName
                                
                               
                               // person.username = pName
                                self.nameModel.newEntries.append(person)
                                self.namesTable.reloadData()
                                
                                do {
                                    try managedObject.save()
                                }catch {
                                    print("error")
                                }
                            }
                        }
                        
                    
                }
                    }
                }
                    else {
                        let alert1 = UIAlertController (title: "Alert", message: "Please fill the field", preferredStyle: .alert)
                        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert1.addAction(OK)
                    }
                    
                }
                
                    
        
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
          
    }
    var checked = [Bool]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.namesTable.dataSource = self
        self.namesTable.delegate = self
        self.namesTable.allowsMultipleSelection = true
        self.namesTable.allowsMultipleSelectionDuringEditing = true
        
            
      }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchNames()
        
    }
}

extension CheckTodoListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameModel.newEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addItem", for: indexPath)
        cell.textLabel?.text = self.nameModel.newEntries[indexPath.row].name
        let task  = self.nameModel.newEntries[indexPath.row].name

        return cell
    }
    
    
}
extension CheckTodoListViewController : UITableViewDelegate {
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}

extension CheckTodoListViewController {
    
    func fetchNames()  {
        self.nameModel.newEntries = []
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                                             
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Userdata")
        do {
            if let record = try context.fetch(fetchRequest) as? [Userdata] {
                self.nameModel.newEntries = record
            }
        }
            catch {
                print(" Error in fetching records : \(error.localizedDescription)")
            }
        }
    }


