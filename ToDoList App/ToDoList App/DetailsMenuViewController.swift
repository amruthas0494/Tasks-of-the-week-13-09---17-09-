//
//  DetailsMenuViewController.swift
//  ToDoList App
//
//  Created by apple on 22/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class DetailsMenuViewController: UIViewController {

    @IBOutlet weak var foodtable: UITableView!
    var name : [String] = []
    var detail : [String] = []
    var prize : [String] = []
    var image : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Sandwiches"
        
        name = ["Veg Sandwich", "Veg Toasted Sandwich", "Cheese Sandwich", "Paneer Sandwich", "Samosa Sandwich", "Bombay Sandwich", "Club Sandwich"]
        detail = ["Dairy - Butter, cream cheese, and shredded cheese","Smear butter or ghee on the bread and toast them until golden on one side","Added cooked, sliced or crumbled bacon on top of the cheese","Paneer is high in protein and very low on carbs","Sandwich, samosas, different veggies are layered and then toasted in a Tawa or a stovetop toaster","This Contains cucumber, tomatoes, onions, potatoes and beets.", "Sandwich of bread (traditionally toasted), sliced cooked poultry, ham or fried bacon, lettuce, tomato, and mayonnaise"]
        prize = ["$5.50", "$7.80", "$10.0", "$8.80", "$7.50", "$5.89", "$10.8"]
        image = ["veg sandwich", "veg toasted sandwich", "Cheese sandwich", "paneer sandwich", "samosa sandwich", "bombay sandwich", "club sandwich"]
        
         // we're storing DetailsMenuTableViewCell.xib file in *nib constant
        
        let nib = UINib.init(nibName: "DetailsMenuTableViewCell", bundle: nil)
        //register the xib containing the custom cell with the table view by passing identifier of the xib to access it in the code
        self.foodtable.register(nib, forCellReuseIdentifier: "Menulist")
        
    }
    


}

extension DetailsMenuViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //first load the nib file using nib of present vc and using .first to grab the first view from the coolection of view
      //  let cell = Bundle.main.loadNibNamed("DetailsMenuTableViewCell", owner: self, options: nil)?.first as! DetailsMenuTableViewCell
        
        //or
           let cell = tableView.dequeueReusableCell(withIdentifier: "Menulist", for: indexPath) as! DetailsMenuTableViewCell
        
        cell.nameLabel.text = name[indexPath.row]
        cell.nameLabel.font = .systemFont(ofSize: 20)
      
        cell.detailLabel.text = detail[indexPath.row]
        cell.prizeLabel.text = prize[indexPath.row]
       // print(cell.prizeLabel.text)
       cell.imageLabel.image = UIImage(named: image[indexPath.row])
        
        return cell
    }
    
    
}
extension DetailsMenuViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
