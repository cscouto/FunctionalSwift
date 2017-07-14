//: Playground - noun: a place where people can play

import UIKit

//declarative
let numbers = [1, 2, 3, 4]

let tripledValues = numbers.map{number in number * 3}
print(tripledValues)

//lazy - only evaluate the first data in the array
let number = numbers.lazy.map{$0 * 3}.first!
print(number)

