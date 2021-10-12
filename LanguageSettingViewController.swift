//
//  LanguageSettingViewController.swift
//  MySecondProject
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

var currentLanguage:String?

class LanguageSettingViewController: UIViewController {

    var newLanguage = LanguageUpdates()
    
    @IBOutlet weak var languageTable: UITableView!
    
    let  array = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"].map({ $0.localized()})
   

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
            print(array)
        languageTable.dataSource = self
        languageTable.delegate = self
        let lang0 = Language(selectLanguage: "Arabic(ara)")
        let lang1 = Language(selectLanguage: "English(UK)")
        let lang2 = Language(selectLanguage: "Hindi(Hi)")
        let lang3 = Language(selectLanguage: "German(de)")
        let lang4 = Language(selectLanguage: "Spanish(Latin America)")
        let lang5 = Language(selectLanguage: "Tamil(Indian)")
        let lang6 = Language(selectLanguage: "Greek(gr)")
        let lang7 = Language(selectLanguage: "Kannada(Kan)")
        let lang8 = Language(selectLanguage: "Urdu(Indian)")
        let lang9 = Language(selectLanguage: "Telugu(Indian)")
        let lang10 = Language(selectLanguage: "Russian(ru)")
        let lang11 = Language(selectLanguage: "Gujurati(gu)")
        let lang12 = Language(selectLanguage: "Marathi(Indian)")
        let lang13 = Language(selectLanguage: "Spanish(sn)")
        let lang14 = Language(selectLanguage: "Chinese(chi)")
        let lang15 = Language(selectLanguage: "Indonesian(ine)")
        let lang16 = Language(selectLanguage: "Italian(ita)")
        let lang17 = Language(selectLanguage: "Kashmiri(kas)")
        let lang18 = Language(selectLanguage: "Malayalam(mal)")
        let lang19 = Language(selectLanguage: "Bengali(be)")
        let lang20 = Language(selectLanguage: "Slovak(sk)")
        
        let newArray = [lang0, lang1, lang2, lang3, lang4, lang5, lang6, lang7, lang8, lang9, lang10, lang11, lang12, lang13, lang14, lang15, lang16, lang17, lang18, lang19, lang20]
        
        self.newLanguage.languageSelected.append(contentsOf: newArray)
        languageTable.tableFooterView = UIView.init(frame: .zero)
        for languages in self.newLanguage.languageSelected {
            self.languageTable.reloadData()
        }
        
    }
    

   

}
extension LanguageSettingViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newLanguage.languageSelected.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.newLanguage.languageSelected[indexPath.row].selectLanguage
        return cell
    }
    
    
}
extension LanguageSettingViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toCountry") as? OtherSelectionViewController
        currentLanguage = self.newLanguage.languageSelected[indexPath.row].selectLanguage
        self.navigationController?.pushViewController(viewcontroller!, animated: true)
    }
    
}

extension String {
 
    func localized(bundle: Bundle = .main, tableName: String = "Localized") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
