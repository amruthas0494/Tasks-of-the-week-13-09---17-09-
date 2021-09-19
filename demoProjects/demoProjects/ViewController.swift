//
//  ViewController.swift
//  demoProjects
//
//  Created by apple on 18/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
protocol changeView: class {
    func viewDisplay()
}

class ViewController: UIViewController {

   
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var view5: UIView!
    
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view4: UIView!
    var labeldisplay:String?
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segue = segue.destination as? SecondViewController
        segue?.labeldata = "Second View Controller"
        segue?.delegate = self
        
    }

}
extension  ViewController : changeView {
    func viewDisplay() {
        view1.backgroundColor = .green
       
        view2.backgroundColor = .blue
        view3.backgroundColor = .blue
        view4.backgroundColor = .systemPink
        view5.backgroundColor = .blue
        view6.backgroundColor = .blue
        view7.backgroundColor = .blue
        view8.backgroundColor = .green
    }
    
    
}

