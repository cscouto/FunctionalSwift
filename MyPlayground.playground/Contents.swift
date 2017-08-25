//: Playground - noun: a place where people can play

import UIKit

//declarative
var numbers = [1, 2, 3, 4, 1]

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



///functions in vars
func addTwoNumbers(a: Double, b: Double) -> Double { return a + b }
func subtractTwoNumbers(a: Double, b: Double) -> Double { return a - b }
//typealias can be used to create custom Types
typealias SimpleOperator = (Double, Double) -> Double
//create a var with the custom type
var simpleMath: SimpleOperator
//add functions to the var
simpleMath = addTwoNumbers
simpleMath(4,3)
simpleMath = subtractTwoNumbers
simpleMath(4,3)
//passing the function as a parameter for another function
func calculateResult(mathOperator: SimpleOperator, a: Double, b: Double)-> Double {
        return mathOperator(a, b)
}
//using custom type as a return
func choosePlusMinus(isPlus: Bool) -> SimpleOperator {
    return isPlus ? addTwoNumbers : subtractTwoNumbers
}
let chosenOperator = choosePlusMinus(isPlus: true)
print("The result is \(chosenOperator(3.5, 5.5))")


///function composition
//split and map
let content = "10,20,40,50,60,70,80,30"
func extractElements(_ content: String) -> [String] {
    return content.characters.split(separator: ",").map{String($0)}
}
let elements = extractElements(content)

func formatWithCurrency(content: [String]) -> [String] {
    return content.map {"\($0)$"}
}
let formattedElements = formatWithCurrency(content: elements)
//using the functions in a functional way
let composedFunction = {
    data in
    formatWithCurrency(content: extractElements(data))
}
composedFunction(content)

///custom operators
//operatorTypes = prefix, infix postfix
infix operator |> { associativity left}
func |> <T, V>(f: @escaping (T) -> V, g: @escaping (V) -> V ) -> (T) -> V {
    return { x in g(f(x)) }
}
let composedWithCustomOperator = extractElements |> formatWithCurrency
composedWithCustomOperator("10,20,40,30,80,60")
let sorted = elements.sorted{ $0 < $1}
print(sorted)

//currying
func curried(x: Int) -> (String) -> Float {
    return {(y: String) -> Float in
        return Float(x) + Float(y)!
    }
}
func explicityRetunClosure(firstName: String) -> (String) -> String {
    return { (lastName: String) -> String in
        return "\(firstName) \(lastName)"
    }
}
let func1 = explicityRetunClosure(firstName: "Joe")
let func2 =  func1("Doe")


///distinct 
print(numbers)
numbers = numbers.reduce([]) { (a: [Int], b: Int) -> [Int] in
    if a.contains(b) {
        return a
    } else {
        return a + [b]
    }
}
print(numbers)


