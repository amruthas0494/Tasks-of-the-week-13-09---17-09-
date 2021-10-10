//
//  CustomButtonTBViewController.swift
//  MySecondProject
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import Toast_Swift


class CustomButtonTBViewController: UIViewController {
//    func ChangeCellValue() {
//       // self.dismiss(animated: true, completion: nil)
//                numberOfRows = counter * 2
//                print(numberOfRows)
//        self.datatable.reloadData()
//    }
    
    @IBOutlet weak var datatable: UITableView!
    
    var counter = 0

  
    var newRowValue:Int = 0
  // var numberOfRows:Int = 2
    
   var numberOfRows : [Int] = []

    var newCell: [Int] = [1,2]
    
    var eventdelegate : eventHandle?
    
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        datatable.dataSource = self
        datatable.delegate = self
        registerXib()
       // display toast with an activity spinner
       self.datatable.makeToastActivity(.center)
        
      // self.view.showToast(myView)
        // create a new style
        var style = ToastStyle()
        self.title = "Toast-Swift"
        // this is just one of many style options
        style.messageColor = .blue

        // present the toast with the new style
                  
        self.view.makeToast("Rows in the cell exceed more than 12", duration: 30.0, position: .bottom, style: style)

        // or perhaps you want to use this style for all toasts going forward?
        // just set the shared style and there's no need to provide the style again
        ToastManager.shared.style = style
        // self.view.makeToast("This is a piece of toast") // now uses the shared style

        // toggle "tap to dismiss" functionality
        ToastManager.shared.isTapToDismissEnabled = true

        // toggle queueing behavior
        ToastManager.shared.isQueueEnabled = true

        // immediately hides all toast views in self.view
        self.view.hideAllToasts()
        
    }
    
    @IBAction func nextTapped(_ sender: UIBarButtonItem) {
        
        counter = counter + 2
               print(counter)
         let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "nextVC") as? NextCustomButtonViewController
      //  viewcontroller?.delegate = self
        viewcontroller?.callBackHandler = upDateRows
                       //view self.present(viewcontroller, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewcontroller!, animated: true)
       // self.performSegue(withIdentifier: "nextVC", sender: AnyClass.self)
    }
   
    func upDateRows() {
       
        numberOfRows.append(contentsOf: newCell)
        print(numberOfRows.count)
        
        datatable.reloadData()
    }
    func showToast(message : String, font: UIFont) {

        let toastLabel = UILabel(frame: CGRect(x: 50, y: self.view.frame.size.height-200, width: 350, height: 100))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
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
        UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}
extension CustomButtonTBViewController {
    func registerXib()  {
        let nib = UINib(nibName: "CustomButtonTBTableViewCell", bundle: nil)
        self.datatable.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        
    }
}
extension CustomButtonTBViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if numberOfRows.count >= 12{
//            let Alert = UIAlertController(title: "Alert", message: "Number of rows exceeded", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//            Alert.addAction(ok)
//            present(Alert, animated: true, completion: nil)
          self.showToast(message: "Cell Exceed more than 12 rows", font: .systemFont(ofSize: 12.0))

        }
       
        return numberOfRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for:indexPath )
        
        
        return cell
    }
   
    
}

extension CustomButtonTBViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
             numberOfRows.remove(at: indexPath.row) //Remove element from your array
                   self.datatable.deleteRows(at: [indexPath], with: .automatic)
            datatable.reloadData()
        }
    }
    
}


