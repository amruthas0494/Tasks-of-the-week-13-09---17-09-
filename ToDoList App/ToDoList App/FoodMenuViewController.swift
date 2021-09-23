//
//  FoodMenuViewController.swift
//  ToDoList App
//
//  Created by apple on 22/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FoodMenuViewController: UIViewController {

    var foodMenu : [String] = []
    
    @IBOutlet weak var foodTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodMenu = ["Sandwitches", "Burgers", "Tacos", "Pizza", "Hot Dogs", "Drinks"]
        foodTable.dataSource = self
        foodTable.delegate = self
    }
    

   
}
extension FoodMenuViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "tofoodMenu", for: indexPath)
        cell.textLabel?.text = foodMenu[indexPath.row]
        return cell
    }
    
    
}

extension FoodMenuViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var index = indexPath.row
        switch index {
        case 0:
              let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "toMainMenu") as? DetailsMenuViewController
                 //view self.present(viewcontroller, animated: true, completion: nil)
              self.navigationController?.pushViewController(viewcontroller!, animated: true)
        default:
            break
        }
      
    }
}
