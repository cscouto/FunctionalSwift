//: Playground - noun: a place where people can play

import UIKit

//declarative
let numbers = [1, 2, 3, 4]

let tripledValues = numbers.map{number in number * 3}
print(tripledValues)

//lazy - only evaluate the first data in the array
let number = numbers.lazy.map{$0 * 3}.first!
print(number)

//tuple
let tuple = (10,2)
print(tuple)

// Tuples
let http400Error = (400, "Bad Request")
// http400Error is of type (Int, String), and equals (400, "Bad Request")

// Decompose a Tuple's content
let (requestStatusCode, requestStatusMessage) = http400Error

//typealias
typealias UnsignedInteger = UInt32

//The ternary conditional operator question ? answer1: answer2

//Nil coalescing -> returns a if a is not nil or b as default if a is nil
//a ?? b

//stride
let fourToTwo = Array(stride(from: 4, to: 1, by: -1)) // [4, 3, 2]
let fourToOne = Array(stride(from:4, through: 1, by: -1)) // [4, 3, 2, 1]

//closures
// a closure that has no parameters and return a String
var hello: () -> (String) = {
    return "Hello!"
}

hello() // Hello!

// a closure that take one Int and return an Int
var double: (Int) -> (Int) = { x in
    return 2 * x
}

double(2) // 4

// you can pass closures in your code, for example to other variables
var alsoDouble = double

alsoDouble(3) // 6

//functions
func extractElements(_ content: String) -> [String] {
    return content.characters.split(separator: ",").map { String($0) }
}

//let elements = extractElements(content)

func formatWithCurrency(content: [String]) -> [String] {
    return content.map {"\($0)$"}
}

//let formattedElements = formatWithCurrency(content: elements)
let composedFunction = { data in
    formatWithCurrency(content: extractElements(data))
}


///functions in vars
func addTwoNumbers(a: Double, b: Double) -> Double { return a + b }
func subtractTwoNumbers(a: Double, b: Double) -> Double { return a - b }
//typealias can be used to create custom Types
typealias SimpleMath = (Double, Double) -> Double
//create a var with the custom type
var simpleMath: SimpleMath
//add functions to the var
simpleMath = addTwoNumbers
simpleMath(4,3)
simpleMath = subtractTwoNumbers
simpleMath(4,3)



