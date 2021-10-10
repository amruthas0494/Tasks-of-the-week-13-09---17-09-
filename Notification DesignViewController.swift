//
//  Notification DesignViewController.swift
//  MySecondProject
//
//  Created by apple on 09/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class Notification_DesignViewController: UIViewController {

    var collectionDetails : [Chat] = []
    var collectionDetails1 : [profileCollection] = []
    var tableData : [Chat] = []
    var screenSize: CGRect!
       var screenWidth: CGFloat!
       var screenHeight: CGFloat!
    let sectionInsets = UIEdgeInsets(
        top: 75.0,
        left: 10.0,
    bottom: 50.0,
    right:20.0)
    
    private var itemsPerRow: CGFloat = 1
       
    @IBOutlet weak var displayCollection: UICollectionView!
    
    @IBOutlet weak var displayCollection1: UICollectionView!
    @IBOutlet weak var displayTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayCollection.dataSource = self
        displayCollection.delegate = self
        displayCollection1.dataSource = self
         displayCollection1.delegate = self
        displayTable.dataSource = self
        displayTable.delegate = self
        
        collectionDetails.append(Chat(image: "boston", name: "Boston Dynamics, the global leader in mobile robotics, has done it again.", desc: "2 hours ago"))
        collectionDetails.append(Chat(image: "smartmask", name: "Face the new normal with protection that’s far from average.", desc: "1 week ago"))
        collectionDetails.append(Chat(image: "hondaasimo2012", name: "Honda Motor Corporation's Asimo, with its humanoid appearance and ability to walk and climb stairs.", desc: "2 hours ago"))
        collectionDetails.append(Chat(image: "tesla bot", name: "Tesla's automotive artificial intelligence and autopilot technologies to plan and follow routes, navigate traffic", desc: "2 hours ago"))
        collectionDetails.append(Chat(image: "boston", name: "Boston Dynamics, the global leader in mobile robotics, has done it again.", desc: "2 hours ago"))
        
        collectionDetails1.append(profileCollection(pImage: "Jeff", pdesc: "Jeff Bezos"))
         collectionDetails1.append(profileCollection(pImage: "sophia", pdesc: "Sophia"))
         collectionDetails1.append(profileCollection(pImage: "steve", pdesc: "Apple"))
         collectionDetails1.append(profileCollection(pImage: "Shigeru", pdesc: "Shigeru, VideoGames"))
        collectionDetails1.append(profileCollection(pImage: "vr", pdesc: "AR VR"))
        
        tableData.append(Chat(image: "boston", name: "Boston Dynamics, the global leader in mobile robotics, has done it again.", desc: "Washington, May 12 2021"))
         tableData.append(Chat(image: "smartmask", name: "Face the new normal with protection that’s far from average.", desc: "Indana, May 12 2021"))
              
//
    }
    
}

extension Notification_DesignViewController : UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.displayCollection {
            return 5
        }
        if collectionView == self.displayCollection1 {
            return 5
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.displayCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? Notify1CollectionViewCell
                   cell?.image1.image = UIImage(named: collectionDetails[indexPath.item].image!)
                   cell?.label1.text = collectionDetails[indexPath.item].name
                   cell?.label2.text = collectionDetails[indexPath.item].desc
                   return cell ?? UICollectionViewCell()
        }
        if collectionView == self.displayCollection1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileDisplay", for: indexPath) as! ProfileCollectionViewCell
            cell.imageDisplay.image = UIImage(named: collectionDetails1[indexPath.item].pImage!)
            cell.imageDisplay.layer.borderWidth = 2
            cell.imageDisplay.layer.masksToBounds = false
//            cell.imageDisplay.layer.borderColor = UIColor.systemGray.cgColor
            cell.imageDisplay.layer.cornerRadius = cell.imageDisplay.frame.width/2 //This will change with corners of image and height/2 will make this circle shape
            cell.imageDisplay.clipsToBounds = true
            cell.labelDisplay.text = collectionDetails1[indexPath.item].pdesc
            return cell ?? UICollectionViewCell()
        }
       return UICollectionViewCell()
    }
    
    
}


extension Notification_DesignViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notification", for: indexPath) as? NotificationTableViewCell
        cell?.displayImage.image = UIImage(named: tableData[indexPath.row].image!)
        cell?.displayL1.text = tableData[indexPath.row].desc
        cell?.displayL2.text = tableData[indexPath.row].name
        
        return cell ?? UITableViewCell()
    }
    
    
}
extension Notification_DesignViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//this extension class  let the vc to conform to flowlayout delegate protocol
extension Notification_DesignViewController: UICollectionViewDelegateFlowLayout {
  // 1 tells layout about size of the cell set
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // 2 total number of space taken by constant paddingspace
        //itemsPerRow is the number of items to be placed in each row
        if collectionView == self.displayCollection {
    let paddingSpace = sectionInsets.top * (itemsPerRow + 1) //evenly size spaces
       let availableWidth = view.frame.width - paddingSpace
       let widthPerItem = availableWidth / itemsPerRow
            
       
       return CGSize(width: widthPerItem, height: widthPerItem)
        }
           
        return CGSize(width: 150, height: 150)
        
      
  }
   
  //3 this method returns the space between cells, header and footer of the constant sectioninsets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    

  
  // 4  below method returns the spacing between each line in the layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
