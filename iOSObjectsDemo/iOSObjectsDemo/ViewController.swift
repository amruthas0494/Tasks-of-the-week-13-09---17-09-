//
//  ViewController.swift
//  iOSObjectsDemo
//
//  Created by apple on 19/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var buttonName: UIButton!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func update_tapped(_ sender: UIButton) {
        
        self.alert(msg: "Upadte button is being clicked")
        
        
    }
    
    func alert(msg : String)  {
        let alert = UIAlertController(title: buttonName!.currentTitle, message:msg, preferredStyle: .alert)
      
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            switch action.style {
            case .default :
                print("Ok")
                self.displayLabel.text = "Successfull"
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
                break
            }
      
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var textfieldData: UITextField!
    
    
    @IBOutlet weak var label2: UILabel!
    
    @objc func upDateLabel()  {
        label2.text = textfieldData.text
    
    }
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBAction func AddImage(_ sender: UIButton) {
        //when button tapped loading images using url
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
        let url = URL(string: "https://i.pinimg.com/736x/46/d5/03/46d50369bd0e98c2b8f12a47101a6b4b.jpg")
        //converting url to data
        let imagedata = try? Data(contentsOf: url!)
        //converting data content of url to UIImage
        let image = UIImage(data: imagedata!)
        displayImage.image = image
        displayImage.layer.cornerRadius = (displayImage.frame.size.height)/2
        displayImage.layer.masksToBounds = true
        alert(msg: "New Image is added")
        
    }
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var On_Off: UISwitch!
    
    @IBAction func switch_Tapped(_ sender: UISwitch) {
        if On_Off.isOn == true {
          
            image2.image = UIImage(named: "moon.png")
            
        }
        else if On_Off.isOn == false{
             image2.image = UIImage(named: "sun.jpeg")
        }
    }
    
    @IBOutlet weak var controlsegment: UISegmentedControl!
    @IBAction func segmented_Tapped(_ sender: UISegmentedControl) {
        
       
        switch controlsegment.selectedSegmentIndex {
            case 0:
                self.scrollview.backgroundColor = .blue
        case 1:
            self.scrollview.backgroundColor = .cyan
            default:
                break
            }
        }
        
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var redslider: UISlider!
    
    @IBAction func showProgress(_ sender: UISlider) {
        // to get the roundfigure value for the slider values we can use as below
        //sliderLabel.text = "Value: \(round(redslider.value))"
    sliderLabel.text = "Value: \(redslider.value)"

    
    }
    
    
    @IBOutlet weak var label3: UILabel!
    
    
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperClicked(_ sender: UIStepper) {
        
     
            label3.font = UIFont.systemFont(ofSize: CGFloat(stepper.value))
            stepper.stepValue = 2
        
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "Label"
        textfieldData.delegate = self
        activityIndicator.startAnimating()
        textfieldData.addTarget(self, action: #selector(upDateLabel), for: .allEvents)
        label3.text = "Swift Language"
    }


}

