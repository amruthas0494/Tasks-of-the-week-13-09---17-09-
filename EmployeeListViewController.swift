//
//  EmployeeListViewController.swift
//  MySecondProject
//
//  Created by apple on 11/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class EmployeeListViewController: UIViewController {

    var viewModel = EmployeeList()
    
    @IBOutlet weak var employeeTable: UITableView!
    
    
    
    @IBAction func addEmpl_Tapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Employee Details", message: " Please fill the text fields", preferredStyle: .alert)
        alert.addTextField { (textfield1) in
            textfield1.placeholder = "Name"
        }
        alert.addTextField { (textfield2) in
            textfield2.placeholder = "Company"
        }
        alert.addTextField { (textfield3) in
            textfield3.placeholder = "Id"
        }
        
        let alertok = UIAlertAction(title: "Add new Employee", style: .default) { (action) in
            guard  let empName = alert.textFields?.first?.text, let empOrg = alert.textFields?[1].text, let empId = alert.textFields?.last?.text else { return }
                
            if (empName != ""), (empOrg != ""), (empId != "") {
            let empDetails = employee(eName: empName, eCompany: empOrg, eId: empId)
                if self.viewModel.validateEmployeeDetails(ename: empName, ecompany: empOrg, eid: empId) {
                self.viewModel.updatedList.append(empDetails)
            self.employeeTable.reloadData()
            }
            }
            else {
                let alert1 = UIAlertController(title: "Error", message: " Please fill all the  fields", preferredStyle: .alert)
                let ok1 = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert1.addAction(ok1)
                self.present(alert1, animated: true, completion: nil)
                }
        }
           
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(alertok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
   func showToast(message : String, font: UIFont) {

       let toastLabel = UILabel(frame: CGRect(x: 50, y: self.view.frame.size.height-200, width: 350, height: 100))
       toastLabel.backgroundColor = UIColor.red.withAlphaComponent(0.6)
       toastLabel.textColor = UIColor.white
       toastLabel.font = font
       toastLabel.textAlignment = .center;
       toastLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 25.0)
       toastLabel.lineBreakMode = NSLineBreakMode(rawValue: 3)!
       toastLabel.text = message
       toastLabel.alpha = 1.0
       toastLabel.layer.cornerRadius = 10;
       toastLabel.clipsToBounds  =  true
       self.view.addSubview(toastLabel)
       UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
       }, completion: {(isCompleted) in
           toastLabel.removeFromSuperview()
       })
   }

   

}
extension EmployeeListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.updatedList.count == 0 {
            self.showToast(message: "No Employee details Available", font: .systemFont(ofSize: 12.0))
        }
        return self.viewModel.updatedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeData", for: indexPath) as? EmployeeTableViewCell
        cell?.nameLabel.text = self.viewModel.updatedList[indexPath.row].eName
        cell?.companyLabel.text = self.viewModel.updatedList[indexPath.row].eCompany
        cell?.idLabel.text = self.viewModel.updatedList[indexPath.row].eId
        
        return cell!
    }
    
    
    
}
extension EmployeeListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
