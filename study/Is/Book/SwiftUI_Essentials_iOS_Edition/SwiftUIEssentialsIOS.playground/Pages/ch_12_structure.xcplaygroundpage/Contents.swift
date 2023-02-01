//: [Previous](@previous)
//: # 12. 스위프트 Structure
import Foundation

struct SampleStruct {
    var name: String
}

let myStruct1 = SampleStruct(name: "Mark")
print(myStruct1.name)

var myStruct2 = myStruct1
myStruct2.name = "David"

print(myStruct1.name) // Mark
print(myStruct2.name) // David

//: ### class
class SampleClass {
    var name: String
    init(name: String) {
        self.name = name
    }
}


let myClass1 = SampleClass(name: "Mark")
print(myClass1.name)

var myClass2 = myClass1
myClass2.name = "David"

print(myClass1.name) // David
print(myClass2.name) // David


//: [Next](@next)|
