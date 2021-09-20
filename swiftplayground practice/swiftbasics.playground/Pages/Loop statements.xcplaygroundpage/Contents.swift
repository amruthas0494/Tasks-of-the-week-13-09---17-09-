//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//empty array
var array : [Int] = []
print("Array created \(array)")
array.append(2)
array.append(6)
print(array)
    //to update or modify index value
array[1] = 22
print(array)
//insert value at perticular position
array.insert(8, at: 2)
print(array)


var newarray = [5, -1, 5, 9, 12, 24]
//adding 2 array values
array.append(contentsOf: newarray)

print(array)

let names = ["Raj", "Rahul", "Ravi", "Maya", "John", "April", "Nithya"]
for name in names {
   print("\(name)")
}

//multiplication of numbers
 let num = 6
for i in 1...10 {
    print("\(num) multiplies \(i) times is \(num * i)")
}
//while loop
var i = 2
while i < 20
{
    if (i % 2 == 0){
        print(i)
    }
    i += 1
}
