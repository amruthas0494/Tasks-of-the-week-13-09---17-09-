//
//  SettingsViewController.swift
//  ToDoList App
//
//  Created by apple on 22/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var section:[String] = []
    var setting1 : [String] = []
    var setting2:[String] = []
       var setting3 : [String] = []
     var setting4 : [String] = []
    var image1 : [String] = []
    var image2:[String] = []
       var image3 : [String] = []
     var image4 : [String] = []
    
    @IBOutlet weak var settingTable: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        
        settingTable.dataSource = self
        settingTable.delegate = self
      //  section = ["", "", "", ""]
        setting1 = ["General", "Accessibility", "Privacy"]
        setting2 = ["Passwords & Accounts"]
        setting3 = ["Maps", "Safari", "News", "Health", "Shortcuts", "Siri & Search", "Photos", "Game Center"]
        setting4 = ["Developer"]
         image1 = ["general", "accessibility", "privacy"]
         image2 = ["password"]
         image3 = ["maps", "safari", "news", "health", "shortcuts", "siri", "photos", "game-center"]
         image4 = ["developer"]
    }
    

   
}

extension SettingsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
                   return 1
        case 1:
                   return setting1.count
        case 2 :
            return setting2.count
        case 3:
            return setting3.count

                default:
                    return setting4.count
             }
        
      
        }
    
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        switch (section) {
//                case 0:
//                   return "Label1"
//                case 1:
//                   return "label2"
//        case 2 :
//            return "label3"
//                default:
//                    return "Label4"
//             }
//    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todatacell", for: indexPath) as! DataSettingsTableViewCell
        switch indexPath.section{
        case 0:
            cell.backgroundColor = .white
            
            cell.displayImage.image = UIImage(named: "profile")
            cell.displayLabel.text = "Sign in to your iPhone"
            cell.displayLabel.textColor = .systemBlue
            cell.displayLabel.font = .systemFont(ofSize: 20)
            cell.displaylabel1.text = "Set up iCloud, the App Stroe and more."
            cell.accessoryType = .none


        case 1:

              cell.displayImage.image = UIImage(named: image1[indexPath.row])
                       cell.displayLabel.text = setting1[indexPath.row]
               cell.displayLabel.textColor = .black
              cell.accessoryType = .disclosureIndicator

        case 2 :

              cell.displayImage.image = UIImage(named: image2[indexPath.row])
            cell.displayLabel.text = setting2[indexPath.row]
             cell.accessoryType = .disclosureIndicator


        case 3:

            cell.displayImage.image = UIImage(named: image3[indexPath.row])
                       cell.displayLabel.text = setting3[indexPath.row]
             cell.displayLabel.textColor = .black
             cell.accessoryType = .disclosureIndicator

        default:

             cell.displayImage.image = UIImage(named: image4[indexPath.row])
            cell.displayLabel.text = setting4[indexPath.row]
              cell.displayLabel.textColor = .black
             cell.accessoryType = .disclosureIndicator

        }

       return cell
    
}

}
extension SettingsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
     return 50

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
             case 0:
                        return 100
             case 1:
                        return 50
             case 2 :
                 return 50
        case 3:
            return 50
                     default:
                         return 50
                  }
}
}
