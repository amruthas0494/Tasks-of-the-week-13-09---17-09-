//
//  NetworkConnectionViewController.swift
//  MySecondProject
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

var currentNetwork:String?
class NetworkConnectionViewController: UIViewController {

   
    var newNetwork = NetworkUpdates()
    
    @IBOutlet weak var networkTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let network1 = Network(connection: "Secure Wi-Fi Network")
        let network2 = Network(connection: "Denzel's iPhone")
        let network3 = Network(connection: "Public Wi-Fi")
        let network4 = Network(connection: "Wi-Fi Network")
      
        
         self.newNetwork.connectedNetwork.append(network1)
         self.newNetwork.connectedNetwork.append(network2)
         self.newNetwork.connectedNetwork.append(network3)
         self.newNetwork.connectedNetwork.append(network4)
       networkTable.tableFooterView = UIView()
        for values in self.newNetwork.connectedNetwork {
            self.networkTable.reloadData()
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       
    }
   

}
extension NetworkConnectionViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newNetwork.connectedNetwork.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "network", for: indexPath) as? NetworkTableViewCell
        cell?.displayNetwork.text = self.newNetwork.connectedNetwork[indexPath.row].connection
        return cell ?? UITableViewCell()
    }
    
    
}

extension NetworkConnectionViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentNetwork = self.newNetwork.connectedNetwork[indexPath.row].connection
    }
    
}
