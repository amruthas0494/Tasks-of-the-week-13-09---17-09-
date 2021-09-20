import UIKit

var str = "Hello, playground"

print(str)
//empty array
var array: [Int] = []
array.append(12)
print(array)
//create and array
var newarray = [1,2,4,6,7]
newarray.append(12)
print(newarray)
newarray.insert(29, at: 4)
print(newarray)

//loop statements
let names = ["raj", "ram", "keerthi", "john", "maya", "april"]
for index in names {

         print("\(index) " )

    
}
//multiples of the given number
let n = 6
for index in 1...10 {
    print("\(index) multiplies \(n) is \(index * n)")
}

class sample {
    var name: String?
    var age: Int?
    init() {
        name = "Akil"
    }
}
var newdata = sample()
newdata.age = 12
print(newdata.age!)
newdata.name = "nihal"
print(newdata.name)
print(newdata.name!)



