//
//  ChatUIDesignViewController.swift
//  MySecondProject
//
//  Created by apple on 05/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ChatUIDesignViewController: UIViewController {

    var images : [String] = []
    var pnames : [String] = []
    var pdesc : [String] = []
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchContent: UISearchBar!
//    // Container view of the segmented control
//    private lazy var segmentedControlContainerView: UIView = {
//        let containerView = UIView()
//        containerView.backgroundColor = .clear
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        return containerView
//    }()
    private enum Constants {
          static let segmentedControlHeight: CGFloat = 40
          static let underlineViewColor: UIColor = .blue
          static let underlineViewHeight: CGFloat = 2
      }
    // The underline view below the segmented control
    private lazy var bottomUnderlineView: UIView = {
        let underlineView = UIView()
        underlineView.backgroundColor = .systemPurple
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        return underlineView
    }()

    private lazy var leadingDistanceConstraint: NSLayoutConstraint = {
        return bottomUnderlineView.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor)
    }()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var displayProfile: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
          images = ["image1", "image2", "image3", "image4", "image5", "image6"]
        pnames = ["Anitha", "Shalu", "Reeta", "Vijay", "Akarsh", "Anurag"]
        pdesc = ["Life is what happens when you're busy making other plans","The purpose of our lives is to be happy.", "The purpose of our lives is to be happy.", "Wherever life plants you, bloom with grace.","Keep your face always towards the sunshine - and shadows falls behind you.", "Happiness is the highest level of success"]
        displayProfile.dataSource = self
        displayProfile.delegate = self
        
        // Change text color and the font of the NOT selected (normal) segment
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)], for: .normal)

//        // Change text color and the font of the selected segment
//        segmentedControl.setTitleTextAttributes([
//            NSAttributedStringKey.foregroundColor: UIColor.blue,
//            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
        containerView.addSubview(segmentedControl)
        bottomUnderlineView.frame = CGRect(x: 10, y: 40, width: 120, height: 2)
        bottomUnderlineView.layer.cornerRadius = 10
               containerView.addSubview(bottomUnderlineView)
        
    }
    
    @IBAction func SegmentedTapped(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
          UIView.animate(withDuration: 0.5) {
              self.bottomUnderlineView.frame = CGRect(x: 10, y: 40, width: 120, height: 2)
          }
           
        case 1 :
            
             UIView.animate(withDuration: 0.5) {
                self.bottomUnderlineView.frame = CGRect(x: 115, y: 40, width: 120, height: 2)
            }
        default:
            print("not tapped")
        }
    }
}
extension ChatUIDesignViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatUIDesignTableViewCell
        cell.imageDisplay.image = UIImage(named: images[indexPath.row])
        cell.imageDisplay.layer.borderWidth = 2
          cell.imageDisplay.layer.masksToBounds = false
        cell.imageDisplay.layer.borderColor = UIColor.systemGray.cgColor
       cell.imageDisplay.layer.cornerRadius = cell.imageDisplay.frame.width/2 //This will change with corners of image and height/2 will make this circle shape
          cell.imageDisplay.clipsToBounds = true
        cell.nameLabel.text = pnames[indexPath.row]
        cell.descLabel.text = pdesc[indexPath.row]
        return cell
    }
    
    
}
extension ChatUIDesignViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
