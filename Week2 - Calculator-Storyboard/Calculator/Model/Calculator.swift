//
//  Calculator.swift
//  Calculator
//
//  Created by Oğuz Kaan Altun on 1.10.2022.
//

import Foundation


struct Calculator {
    private var number: Double?
    private var firstNumberAndOperation: (n1: Double, op: String)?

    mutating func setNumber(to number: Double) {
        self.number = number
    }
    
    mutating func calculate(with operation: String) -> Double? {
        
        if let number = number {
            switch operation {
            case "AC":
                firstNumberAndOperation = nil
                return 0
            case "+/-":
                return number * -1
            case "%":
                return number * 0.01
            case "1/x":
                return 1 / number
            case "e":
                return M_E
            case "π":
                return Double.pi
            case "x!":
                return factorial(of: number)
            case "√x":
                return sqrt(number)
            case "log":
                return log10(number)
            case "ln":
                return log(number)
            case "sin":
                return sin(number)
            case "cos":
                return cos(number)
            case "=":
                let result = performTwoNumberCalculation(n2: number)
                firstNumberAndOperation = nil
                return result
            default:
                if firstNumberAndOperation != nil {
                    let result = performTwoNumberCalculation(n2: number)
                    firstNumberAndOperation?.op = operation
                    return result
                }
                firstNumberAndOperation = (n1: number, op: operation)
            }
        }
        
        return nil
    }
    
    mutating func performTwoNumberCalculation(n2: Double) -> Double? {
        if var n1 = firstNumberAndOperation?.n1,
           let operation = firstNumberAndOperation?.op {
            
            switch operation {
            case "+":
                n1 = n1 + n2
            case "-":
                n1 = n1 - n2
            case "×":
                n1 = n1 * n2
            case "÷":
                n1 = n1 / n2
            case "xʸ":
                n1 = pow(n1, n2)
            default:
                fatalError("Operation not found.")
            }
            firstNumberAndOperation?.n1 = n1
            return n1
        }
        return number
    }
    
    func factorial(of number: Double) -> Double? {
        let isInt = floor(number) == number
        if isInt {
            if number < 0 { return number * factorial(of: (number * -1) - 1)! }
            else if number == 0 || number == 1 { return 1 }
            else { return number * factorial(of: number - 1)! }
        } else {
            return nil
        }
    }
}
