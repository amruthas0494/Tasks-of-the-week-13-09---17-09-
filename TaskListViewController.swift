//
//  TaskListViewController.swift
//  MyFirstProject
//
//  Created by apple on 01/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UISearchBarDelegate {
    
    

    @IBOutlet weak var taskList: UITableView!
    
    var taskNo: [String] = []
    var taskName: [String] = []
    
    var filterTask : [String] = []
    var isSearching = false
    
   
   
    
    @IBOutlet weak var mySearchText: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskNo = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"]
        taskName = ["Creating the UIView and setting autolayouts","Creating a dynamic to-do list app", "Passing data to the next screen", "Write code to show the Example for stored and computed property with getter and setter", "Work on how to use all UIElements in Xcode", "Creating To Do list app - Include Delete and edit functionalities", "Replicate the UIView of Setting app", "Create app on food menu using xib file", "Creating application to login with different accounts", "Create application to display Grid view based on the input given by user (number of views)", "Working on the asynchronous task using API", "Design the UIView replica of ATM card and to calculate when expression is paased in textfield", "Dismissing numberpad keyboard", "Perform mathematical operation using closures", "Design the UIView of iPhone Setting app group sections using enumeration", "Display the current time in 12hr and 24 hr format"]
        
        self.mySearchText.delegate = self
        //filterTask = taskName
        //mySearchText = ""
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         filterTask = taskName.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
               isSearching = true
               taskList.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       isSearching = false
        mySearchText.text = ""
        taskList.reloadData()
        
    }


}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filterTask.count
        }else {
           return taskName.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasklist", for: indexPath) as! TaskListTableViewCell
        if isSearching {
           cell.label1.text = taskNo[indexPath.row]
            cell.label2.text = filterTask[indexPath.row]
        }
        else {
           cell.label1.text = taskNo[indexPath.row]
            cell.label2.text = taskName[indexPath.row]
        }
      
        return cell
    }
    
    
}
extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UIView") as? DesignUIViewViewController
           // self.present(viewcontroller!, animated: true, completion: nil)
            self.navigationController?.pushViewController(viewcontroller!, animated: true)
        case 1:
            
            let viewcontroller1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toDynamicTableview") as? DynamicAppViewController
            self.navigationController?.pushViewController(viewcontroller1!, animated: true)
        case 2:
            let viewcontroller2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UIView") as? DesignUIViewViewController
            self.navigationController?.pushViewController(viewcontroller2!, animated: true)
        case 3:
          /*  let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UIView") as? DesignUIViewViewController
           // self.present(viewcontroller!, animated: true, completion: nil)
            self.navigationController?.pushViewController(viewcontroller!, animated: true)
 */
             print("Examples in swift playground")
        case 4:
            let viewcontroller4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toScrollView") as? ScrollDesignViewController
            self.navigationController?.pushViewController(viewcontroller4!, animated: true)
        case 5:
            let viewcontroller5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toDynamicTableview") as? DynamicAppViewController
            self.navigationController?.pushViewController(viewcontroller5!, animated: true)
       case 6:
            let viewcontroller6 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toSettings") as? SettingsViewController
                 // self.present(viewcontroller!, animated: true, completion: nil)
            self.navigationController?.pushViewController(viewcontroller6!, animated: true)
        case 7:
            let viewcontroller7 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tofoodMenu") as? FoodMenuViewController
            self.navigationController?.pushViewController(viewcontroller7!, animated: true)
        case 8:
            let viewcontroller8 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toLogin") as? ViewController
            self.navigationController?.pushViewController(viewcontroller8!, animated: true)
        case 9:
            let viewcontroller9 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toGridView") as? UpdateLayoutViewController
                 // self.present(viewcontroller!, animated: true, completion: nil)
            self.navigationController?.pushViewController(viewcontroller9!, animated: true)
        case 10:
                  
            let viewcontroller10 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toFetchAPI") as? APIDataViewController
            self.navigationController?.pushViewController(viewcontroller10!, animated: true)
        case 11:
            let viewcontroller11 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toATMCard") as? ATMcardDesignViewController
            self.navigationController?.pushViewController(viewcontroller11!, animated: true)
        case 12:
                            
            let viewcontroller12 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toKeyboard") as? DismissKeyboardViewController
            self.navigationController?.pushViewController(viewcontroller12!, animated: true)
        case 13:
            /*let viewcontroller13 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toDynamicTableview") as? DynamicAppViewController
            self.navigationController?.pushViewController(viewcontroller13!, animated: true)
             */
             print("Examples in swift playground")
        case 14:
            let viewcontroller14 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toSettingsApp") as? iPhoneSettingViewController
            self.navigationController?.pushViewController(viewcontroller14!, animated: true)
        case 15:
             let viewcontroller15 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toTimeView") as? TimeDisplayViewController
            self.navigationController?.pushViewController(viewcontroller15!, animated: true)
       
                      
        default:
            print("error")
        }
    }
}
//extension TaskListViewController : UISearchBarDelegate {
//
//
//}
