//
//  HomeViewController.swift
//  MyFirstProject
//
//  Created by apple on 23/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    @IBOutlet weak var numberGrid: UICollectionView!
    
    var numberList : [Int] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1...100 {
            print(i)
            numberList.append(i)
        }
    }
    


}

extension HomeViewController : UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCell", for: indexPath) as! HomeCollectionViewCell
        cell.displayNumber.text = String(numberList[indexPath.row])
        return cell
    }
    
    
}
