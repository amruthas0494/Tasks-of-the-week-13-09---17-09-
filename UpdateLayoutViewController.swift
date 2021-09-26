//
//  UpdateLayoutViewController.swift
//  MyFirstProject
//
//  Created by apple on 26/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class UpdateLayoutViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addText: UITextField!
    var numberofItems : [Int] = []
    // private let reuseIdentifier = "updateCell"
    
    @IBOutlet weak var numberTableView: UICollectionView!
    var text: String = ""
    private let sectionInsets = UIEdgeInsets(
    top: 5.0,
    left: 2.0,
    bottom: 5.0,
    right:2.0)
    
    private var itemsPerRow: CGFloat = 6

    override func viewDidLoad() {
        super.viewDidLoad()

        for number in 1...100 {
                   numberofItems.append(number)
               }
        
        
        addText.delegate = self
        //add action to the textfield
        addText.addTarget(self, action: #selector(addText_clicked), for: .allEditingEvents)
       
    }
    

    @objc func addText_clicked()  {
       
//        if let n = NumberFormatter().number(from: text) {
//            itemsPerRow = CGFloat(n)
//            print(itemsPerRow)
//
//            numberTableView.reloadData()
//        }
        
        // to convert value of type string to CGFloat
          text = addText.text!
    
        var cgFloat: CGFloat?

        if let doubleValue = Double(text) {
            cgFloat = CGFloat(doubleValue)
            itemsPerRow = cgFloat!
        }
        print(itemsPerRow)
        numberTableView.reloadData()
   }

}

extension UpdateLayoutViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberofItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "updateCell", for: indexPath)
        cell.backgroundColor = .cyan
         return cell
    }
    
    
}

//this extension class  let the vc to conform to flowlayout delegate protocol
extension UpdateLayoutViewController: UICollectionViewDelegateFlowLayout {
  // 1 tells layout about size of the cell set
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // 2 total number of space taken by constant paddingspace
        //itemsPerRow is the number of items to be placed in each row
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
       let availableWidth = view.frame.width - paddingSpace
       let widthPerItem = availableWidth / itemsPerRow
       
       return CGSize(width: widthPerItem, height: widthPerItem)
        
  }
  
  //3 this method returns the space between cells, header and footer of the constant sectioninsets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    

  
  // 4  below method returns the spacing between each line in the layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
