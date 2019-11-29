//
//  InvalidCalculation.swift
//  Calculator
//
//  Created by Matthijs Roelink on 29/11/2019.
//  Copyright © 2019 Matthijs Roelink. All rights reserved.
//

enum InvalidCalculation: Error {
    //case SignExpected
    case NotComplete
    case NumberExpected
    case Full
}
