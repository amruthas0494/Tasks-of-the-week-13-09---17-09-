//
//  TimeDisplayViewController.swift
//  MyFirstProject
//
//  Created by apple on 01/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TimeDisplayViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    var after = Int()
     var remind = Int()
     var countInterval = TimeInterval()
    var dateString = ""
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            
            
//            let formatter = DateFormatter()
//            formatter.timeStyle = .long
//            formatter.dateStyle = .long
//
//            let dateString = formatter.string(from: currentDate)
            let now = Date()
            let pasttime = Date(timeIntervalSinceNow: +1)

             let formatter = DateFormatter()

             formatter.timeZone = TimeZone.current

             formatter.dateFormat = "hh:mm:ss a"

              dateString = formatter.string(from: now)
              timeLabel.text = dateString
//            countInterval =
//                    remind = Int(countInterval)
//                        after = Int(countInterval) - remind / 60
        case 1:
            let currentTime = Date()
                      //let pasttime = Date(timeIntervalSinceNow: +1)

                       let formatter = DateFormatter()

                       formatter.timeZone = TimeZone.current

                       formatter.dateFormat = "HH:mm:ss"

                        dateString = formatter.string(from: currentTime)
                        timeLabel.text = dateString
        default:
            print("error")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(segmentTapped(_:)), userInfo: nil, repeats: true)
      

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
