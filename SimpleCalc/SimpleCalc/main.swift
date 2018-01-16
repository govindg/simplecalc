//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let size = args.count
        if size <= 1 {
            return 0
        }
        // Checking for factorial expression
        if args[1] == "fact" {
            let num = Int(args[0])!
            return do_factorial(num)
        }
        // Checking for average expression
        if args[size - 1] == "avg" {
            var i = 0
            var sum = 0
            while (i < size - 1) {
                let num = Int(args[i])!
                sum = sum + num
                i += 1
            }
            return sum / (size - 1)
        }
        // Checking for count expression
        if args[size - 1] == "count" {
            return size - 1
        }
        // Checking for regular operations
        if size == 3 {
            let num1 = Int(args[0])!
            let num2 = Int(args[2])!
            switch args[1] {
                case "+":
                    return num1 + num2
                case "-":
                    return num1 - num2
                case "*":
                    return num1 * num2
                case "/":
                    return num1 / num2
                case "%":
                    return do_mod(num1, num2)
                default:
                    return 0
            }
        }
        return 0
    }
    // Modulus function
    public func do_mod(_ num1: Int, _ num2: Int) -> Int {
        let div = num1 / num2
        return num1 - (div * num2)
    }
    // Factorial function
    public func do_factorial(_ num: Int) -> Int {
        if num == 0 || num == 1 {
            return 1
        }
        return num * do_factorial(num - 1)
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

