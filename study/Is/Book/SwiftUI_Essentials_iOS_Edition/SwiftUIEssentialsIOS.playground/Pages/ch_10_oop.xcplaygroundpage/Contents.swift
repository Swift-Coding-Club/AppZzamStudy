//: [Previous](@previous)

import UIKit

func doubleFunc1(value: Int) -> some Equatable {
    value * 2
}

func doubleFunc2(value: String) -> some Equatable {
    value + value
}

let intOne = doubleFunc1(value: 10)
let intTwo = doubleFunc1(value: 20)
let stringOne = doubleFunc2(value: "hello")

let message1 = intOne == intTwo ? "match" : "not match"
print(message1)

//let message2 = intOne == stringOne ? "match" : "not match"
//print(message2)

//: [Next](@next)
