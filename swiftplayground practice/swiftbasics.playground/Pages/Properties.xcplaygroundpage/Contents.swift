//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
print(str)
//: [Next](@next)
//propeties
//stored properties can initial its value and modify its value using initializers
class setTemp {
    var temperature: Double //stored properties
    init() {
        temperature = 30.0
        print("temperature set is \(temperature)")
    }

}
//or
//can provide default value by assigning value during definition
class setnewtemp {
    var newtemp = 29.0
    func updatetemp()  {
        print("new temperature is \(newtemp)")
    }
}
let newclass = setnewtemp()
print(newclass.newtemp)


//example 3
class fixLength {
    var value : Int
    let lengthOfValue : Int
    init() {
        self.value = 7
        self.lengthOfValue = 6
    }
    
}
let newRange = fixLength()
newRange.value = 7
//newRange.lengthOfValue = 4
print(newRange.value)
print(newRange.lengthOfValue)
newRange.value = 8
print(newRange.value)

var newRangelength = fixLength()
newRange.value = 12
print(newRange.value)
print(newRange.lengthOfValue)
newRange.value = 8
print(newRange.value)


struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems.firstValue)


//cannot assign new value for the property as the strucuture instance is assigned to constant
//let newrangeforitems = FixedLengthRange(firstValue: 4, length: 3)
//newrangeforitems.firstValue = 8

//creating instance for the class and assigneing values to the stores properties
class Person {
    var name :  String
    let age : String
    init(names : String, ages : String) {
        self.name = names
        self.age = ages
    }
}
var data = Person(names: "Rakul", ages: "14")
print(data.name)
print(data.age)


class displaydata: Person {
    func display()  {
        print("Name: \(name)")
        print("Age: \(age)")
      
    }
}

let newPerson = displaydata(names: "Mayadevi", ages: "28")
newPerson.display()
newPerson.name = "Nikitha"
print(newPerson.name)
newPerson.name = "Navya"

class getPersondata: displaydata {
    //var address: String
//    init(newname: String, newage:String, address: String) {
//        super.init(names: newname, ages: newage, address : self.address)
    init(newname: String, newage:String) {
        super.init(names: newname, ages: newage)
       // self.address = address
        
    }
   
}
//var getPersonValue = getPersondata(address: "#89, Jaynagar, Bangalore")
var getPersonValue1 = getPersondata(newname: "Nitya", newage: "29")
getPersonValue1.display()
//cannot update or modify value of age  because it is a constant stored property
//getPersonValue.age = "24"
//getPersonValue1.address = "#12, Vijaynagar, Bangalore"

// Computed Properties

class cuboid {
    var length : Int = 0
    var result : Int = 0
    var newlength : Int {
       
        get {
            return length * length * length
        }
        set {
            self.length = newValue
           
        }
    }
    
}
let newCubeValue = cuboid()
newCubeValue.length = 5
print(newCubeValue.length)
newCubeValue.newlength
print(newCubeValue.newlength)
newCubeValue.result
//setting values for other property using setter
newCubeValue.newlength = 4
print(newCubeValue.length)


//with getter and setter for computed properties
class rectangle {
    var width : Double = 0.0
    var height : Double = 0.0
    var rect : Double {
        get {
        return width*height
        
    }
        set {
            self.width = sqrt(newValue)
            self.height = sqrt(newValue)
        }
    }
    
}

var dataResult = rectangle()
dataResult.rect
print(dataResult.rect)
dataResult.rect
dataResult.self
dataResult.width = 2.0
dataResult.height = 4.0
dataResult.rect = 325
print(dataResult.width)


//ready-only computed properties
//computed property will only retrieve data and not using any setter
class personData {
    var firstString : String = ""
    var secstring  = ""
    var newString : String {
        return firstString + "" + secstring
    }
}

let fullname = personData()
fullname.firstString = "Namratha"
fullname.secstring = "Shetty"
fullname.newString
print("My full name is \(fullname.newString)")

//using property observers for computed properties
class Display {
    var stored: String = "Language" {
        //called before the value is set
        willSet {
            
            print("willSet was called")
            print("stored is now equal to \(stored)")
            print("stored will be set to \(newValue)")
        }
//called after the value is set
        didSet {
            print("didSet was called")
            print("stored is now equal to \(stored)")
            print("stored was previously set to \(oldValue)")
        }
    }
}

var observer = Display()
observer.stored = "Swift Programming language"
observer.stored = "Changed to python"



//example of structure for the computed properties using getter and setter
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"
