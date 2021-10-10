//
//  AddItem.swift
//  MySecondProject
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

//class Names {
//
//    var name:String!
//    init(name:String) {
//        self.name = name
//    }
//
//}
/*
class Names: NSObject, NSCoding {
    var name: String
   // var schema: String
    init(name: String) {
        self.name = name
        //self.schema = schema
    }
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
       // self.schema = decoder.decodeObject(forKey: "schema") as? String ?? ""
    }
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
       // coder.encode(schema, forKey: "schema")
    }
}
extension UserDefaults {
    var name: [Names] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "domainSchemas") else { return [] }
            return (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)) as? [Names] ?? []
        }
        set {
            UserDefaults.standard.set(try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false), forKey: "domainSchemas")
        }
    }
}
class Names:Codable {

    var name:String!
    init(name:String) {
        self.name = name
    }

}
*/
class Names: NSObject, NSCoding {

    var name:String?
    

    required init(name:String) {

        self.name = name
       
    }


    required init(coder aDecoder: NSCoder) {

        name = aDecoder.decodeObject(forKey: "name") as? String
      
    }


    public func encode(with aCoder: NSCoder) {

        aCoder.encode(name, forKey: "name")
       

    }
}
