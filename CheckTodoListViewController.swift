//
//  CheckTodoListViewController.swift
//  MySecondProject
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit


class CheckTodoListViewController: UIViewController {

    var newData : [Names] = []
    var storeData : [String]  = []
     var storeData1 : [Names]  = []
    var counter = 0
    var storeValues: Names!
    var userDefaults = UserDefaults.standard
    @IBOutlet weak var namesTable: UITableView!
    
    @IBAction func addItemTapped(_ sender: Any) {
        counter = counter + 1
        let alert = UIAlertController(title: "Add New To-Do Item", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Create new Item"
        }
              let ok = UIAlertAction(title: "Add Item", style: .default) { (action) in
                if let pName = alert.textFields?.first?.text {
                    if pName != "" {
//                        self.storeData.append(pName)
//                        print(storeData)
                        let addItem = Names(name: pName)
                        //UserDefaults.standard.name = .init(arrayLiteral: addItem)
                        self.storeValues = addItem
                        self.newData.append(addItem)
                  
                        
                        self.namesTable.reloadData()
                        
                    }
                    else {
                        let alert1 = UIAlertController (title: "Alert", message: "Please fill the field", preferredStyle: .alert)
                        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert1.addAction(OK)
                    }
                    
                }
                
              }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
          
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.namesTable.dataSource = self
        self.namesTable.delegate = self
//        self.storeData = newData
     // newData.append(Names(name: "Mike"))
    // newData.append(Names(name: "Diana"))
//        newData.append(Names(name: "Roma"))
//        newData.append(Names(name: "Nisha Kotari"))
//        newData.append(Names(name: "Ameesha Pandey"))
//        newData.append(Names(name: "Niharika Shetty"))
        self.namesTable.allowsMultipleSelection = true
    let defaults = UserDefaults.standard
    defaults.set(newData, forKey: "SavedStringArray") as? NSArray
        print(defaults)
       storeData1 = defaults.stringArray(forKey: "SavedStringArray") as? [Names] ?? [Names]()
        print("data", storeData1)
        ArchiveUtil.savePeople(people: newData)

        let others = ArchiveUtil.loadPeople()

        for human in others! {

            print("name = \(human.name!)")
        }
//       do {
//           // Create JSON Encoder
//           let encoder = JSONEncoder()
//
//           // Encode Note
//           let data = try encoder.encode(newData)
//        // Write/Set Data
//        UserDefaults.standard.set(data, forKey: "names")
//
//       } catch {
//           print("Unable to Encode Note (\(error))")
//       }
//
//        if let data = UserDefaults.standard.data(forKey: "names") {
//        do {
//            // Create JSON Decoder
//            let decoder = JSONDecoder()
//
//            // Decode Note
//            let note = try decoder.decode([Names].self, from: data)
//
//        } catch {
//            print("Unable to Decode Note (\(error))")
//        }
//    }
//        let encoder = JSONEncoder()
//           if let encoded = try? encoder.encode(newData) {
//               UserDefaults.standard.set(encoded, forKey: "savedPerson")
//           }
      }
}

extension CheckTodoListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addItem", for: indexPath)
        cell.textLabel?.text = newData[indexPath.row].name
        //cell.textLabel?.text = storeData1[indexPath.row].name
        return cell
    }
    
    
}
extension CheckTodoListViewController : UITableViewDelegate {

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark

    }

     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
    }
     
}

class ArchiveUtil {

    private static let PeopleKey = "PeopleKey"

    private static func archivePeople(name : [Names]) -> NSData {

        return NSKeyedArchiver.archivedData(withRootObject: name as NSArray) as NSData
    }

    static func loadPeople() -> [Names]? {

        if let unarchivedObject = UserDefaults.standard.object(forKey: PeopleKey) as? Data {

            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Names]
        }

        return nil
    }

    static func savePeople(people : [Names]?) {

        let archivedObject = archivePeople(name: people!)
        UserDefaults.standard.set(archivedObject, forKey: PeopleKey)
        UserDefaults.standard.synchronize()
    }

}
