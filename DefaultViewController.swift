//
//  DefaultViewController.swift
//  MySecondProject
//
//  Created by apple on 11/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import  ColorSlider

class DefaultViewController: UIViewController {

    
    @IBOutlet weak var myslider: UISlider!
    var colorSlider: ColorSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorSlider = ColorSlider()
        colorSlider.frame = CGRect(x: 100, y: 450, width: 250, height: 20)
        
        view.addSubview(colorSlider)
        
        colorSlider.addTarget(self, action: #selector(changedColor(slider:)), for: .valueChanged)
        colorSlider.layer.cornerRadius = 2.0
        colorSlider.layer.borderWidth = 2.0
        colorSlider.layer.borderColor = UIColor.white.cgColor
        //colorSlider.sectio= UIEdgeInsetsMake(0.0, 20.0, 0.0, 20.0)
        self.colorSlider.addSubview(myslider)
        
        
    }
    
    @objc func changedColor(slider: ColorSlider) {
        var myColor = slider.color
        self.view.backgroundColor = myColor
        self.myslider.minimumTrackTintColor = myColor
        self.myslider.thumbTintColor = myColor
        
    }
   

}
