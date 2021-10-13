//
//  NamesList.swift
//  MySecondProject
//
//  Created by apple on 11/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class NamesList {
    
    
    var newEntries : [Userdata] = []
    func validateNames(uName:String) -> Bool {
        let filterNames = newEntries.filter { (newname) -> Bool in
            return newname.name == uName
           
           
        }
        return (filterNames.count < 1)
    }
    
}
