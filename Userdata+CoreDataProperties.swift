//
//  Userdata+CoreDataProperties.swift
//  MySecondProject
//
//  Created by apple on 13/10/21.
//  Copyright © 2021 apple. All rights reserved.
//
//

import Foundation
import CoreData


extension Userdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Userdata> {
        return NSFetchRequest<Userdata>(entityName: "Userdata")
    }

    @NSManaged public var name: String?
    @NSManaged public var selected: Bool

}
