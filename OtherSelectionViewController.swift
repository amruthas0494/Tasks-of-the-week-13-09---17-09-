//
//  OtherSelectionViewController.swift
//  MySecondProject
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
var currentRegion:String?
class OtherSelectionViewController: UIViewController {

    
    var cLanguage:String?
    
    
    @IBOutlet weak var countryList: UITableView!
    
    var countryarray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryarray = ["Afhganisthan","Albania", "Algeria", "Andora", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbajian", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Benin", "Bhutan", "Brazil", "Bulgaria", "Burkina Faso", "Cambodia", "Cameroon","Canada", "Central African Republica", "Chile", "China", "Colombia", "Congo", "Cook Islands", "Costa Rica", "Cuba", "Cyprus", "Denmark", "Dominica", "Dominican Republic", "Egypt", "El Salvador", "EquatorialGuinea", "Eritrea", "Estonia", "Ethiopia", "Finland", "France", "Gambia", "Georgia", "Germany", "Greece", "Guinea", "Guyana", "Haiti", "Hungary", "Iceland", "India", "Indonesia", "Iran","Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Luxembourg", "Madagascar", "Malawi","Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritius", "Mexico", "Monaco", "Mongolia", "Morocco", "Myanmar", "Namibia", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Macedonia", "Norway", "Oman", "Pakisthan", "Palau", "Paraguay", "Pappua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Rwanada", "Saint Kitts and Nevis", "Samoa", "San Marino", "Senegal", "Serbia", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "Spain", "Sri Lanka", "Sudan", "Sweden", "Switzerland", "Syrian Arab Republic", "Thailand", "Timor-Leste", "Togo", "Tongo", "Tunisia", "Turkey", "Turkmenistan", "Uganda", "Ukraine","United Arab Emirates", "United Kingdom", "United Republic", "Uzbekistan", "Venezuala","Viet Nam", "Yemen", "Zambia", "Zimbabwe"]
    }
    


}

extension OtherSelectionViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return countryarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryList2", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "United States"
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
        case 1 :
            cell.textLabel?.text = countryarray[indexPath.row]
             cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            
        default:
            print("No country added")
        }
        return cell
    }
    
    
    
    
}
extension OtherSelectionViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toQuickStart") as? QuickStartViewController
        currentRegion = countryarray[indexPath.row]
        self.navigationController?.pushViewController(viewcontroller!, animated: true)
    }
}
