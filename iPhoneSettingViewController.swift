//
//  iPhoneSettingViewController.swift
//  MyFirstProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

enum settingsGroup: CaseIterable {
    case SignIn
    case GeneralSetting
    case Security
    case AppSetting
    case Developer
}
extension settingsGroup {
    
    var numberOfSetting: Int {
        switch self {
        case .SignIn:
            return 1
        case .GeneralSetting:
            return 3
        case .Security:
            return 1
        case .AppSetting:
            return 8
        default:
            return 1
        }
    }
    
    
}
class iPhoneSettingViewController: UIViewController {

    var generalSetting : [String] = []
    var setting2:[String] = []
    var appSetting : [String] = []
    
    var generalImages : [String] = []
      var image2:[String] = []
      var appImages : [String] = []
    @IBOutlet weak var settingTable: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

          generalSetting = ["General", "Accessibility", "Privacy"]
        
          appSetting = ["Maps", "Safari", "News", "Health", "Shortcuts", "Siri & Search", "Photos", "Game Center"]
          //setting4 = ["Developer"]
         generalImages = ["setting", "accessibility", "privacy"]
        appImages = ["map", "safari", "news", "health", "shortcuts", "siri", "photos", "game-center"]
        
    }
    

   

}
extension iPhoneSettingViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsGroup.allCases.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsGroup.allCases[section].numberOfSetting
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        
        switch indexPath.section {
        case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! iPhoneSigninTableViewCell
             cell.profile.image = UIImage(named: "Profile-PNG-File")
            cell.profile.frame.size = CGSize(width: 100, height: 100)
            cell.signInlabel.text = "Sign in to your iPhone"
           // cell.descLabel.isHidden =  false
            cell.signInlabel.textColor = .systemBlue
             cell.signInlabel.font = .systemFont(ofSize: 20)
            cell.descLabel.text = "Set up iCloud, the App Store and more."
            cell.accessoryType = .none
              return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! iPhoneSettingTableViewCell
            cell.imageDisplay.image = UIImage(named: generalImages[indexPath.row])
            cell.label1Display.text = generalSetting[indexPath.row]
            cell.label1Display.textColor = .black
            cell.accessoryType = .disclosureIndicator
           // cell.label2Display.isHidden = true
              return cell
        case 2:
             let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! iPhoneSettingTableViewCell
            cell.imageDisplay.image = UIImage(named: "security")
                cell.label1Display.text = "Passwords & Accounts"
                       cell.label1Display.textColor = .black
                       cell.accessoryType = .disclosureIndicator
                      // cell.label2Display.isHidden = true
              return cell
        case 3:
             let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! iPhoneSettingTableViewCell
            cell.imageDisplay.image = UIImage(named: appImages[indexPath.row])
                       cell.label1Display.text = appSetting[indexPath.row]
                       cell.label1Display.textColor = .black
                       cell.accessoryType = .disclosureIndicator
                       //cell.label2Display.isHidden = true
              return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! iPhoneSettingTableViewCell
            cell.imageDisplay.image = UIImage(named: "developer")
                            cell.label1Display.text = "Developer"
                                  cell.label1Display.textColor = .black
                                  cell.accessoryType = .disclosureIndicator
                                  //cell.label2Display.isHidden = true
              return cell
        default:
            print("error")
            
        }
      return UITableViewCell()
    }
    
    
}

extension iPhoneSettingViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 50
        case 2:
            return 50
        case 3:
            return 50
        case 4:
            return 50
        default:
            //print("others")
            break
        }
        return 50
    }
}
