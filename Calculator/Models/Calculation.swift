//
//  Calculation.swift
//  Calculator
//
//  Created by Matthijs Roelink on 29/11/2019.
//  Copyright © 2019 Matthijs Roelink. All rights reserved.
//

class Calculation {
    private var firstNumber: Int?
    private var secondNumber: Int?
    private var sign: Sign?
    
    var calculation: String {
        var result = "Nothing here..."
        if let first = firstNumber {
            result += "\(first)"
            if let sign = sign {
                result += " \(sign.rawValue)"
                if let second = secondNumber {
                    result += " \(second)"
                }
            }
        }
        return result
    }
    
    func addNumber(_ number: Int) {
        if firstNumber == nil {
            firstNumber = number
        } else if let first = firstNumber {
            firstNumber = first * 10 + number
        } else if secondNumber == nil {
            secondNumber = number
        } else if let second = secondNumber {
            secondNumber = second * 10 + number
        }
    }
    
    func addSign(_ sign: Sign) throws {
        if firstNumber == nil {
            throw InvalidCalculation.NumberExpected
        } else if self.sign == nil {
            self.sign = sign
        } else if secondNumber == nil {
            throw InvalidCalculation.NumberExpected
        } else {
            throw InvalidCalculation.Full
        }
    }
    
    func calculate() throws -> Double {
        if let first = firstNumber, let sign = sign, let second = secondNumber {
            switch sign {
                case .plus:
                    return Double(first + second)
                case .minus:
                    return Double(first - second)
                case .times:
                    return Double(first * second)
                case .divide:
                    return Double(first / second) //TODO: check if this is correct
            }
        }
        throw InvalidCalculation.NotComplete
    }
    
    
}
