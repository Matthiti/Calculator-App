//
//  ContentView.swift
//  Calculator
//
//  Created by Matthijs Roelink on 29/11/2019.
//  Copyright © 2019 Matthijs Roelink. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var result: Double?
    private var calculation: Calculation
    
    init() {
       calculation = Calculation()
    }
    
    var body: some View {
        VStack {
            VStack {
                //calculationResult()
                calculationInput()
            }
            VStack {
                inputs()
            }
        }
    }
    
    func calculationInput() -> AnyView {
        return AnyView(
            Text(calculation.calculation)
                .bold()
        )
    }
    
    func calculationResult() -> AnyView {
        var text: String
        if let calc = result {
            text = "\(calc)"
        } else {
            text = "Press '=' to calculate."
        }
        return AnyView(
            Text(text)
                .bold()
        )
    }
    
    func numberButton(number: Int) -> AnyView {
        return AnyView(
            Button(action: {self.calculation.addNumber(number)}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    Text("\(number)")
                        .foregroundColor(Color.white)
                }
            }
        )
    }
    
    func signButton(sign: Sign) -> AnyView {
        return AnyView(
            Button(action: {do {try self.calculation.addSign(sign)} catch {}} ) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    Text("\(sign.rawValue)")
                        .foregroundColor(Color.white)
                }
            }
        )
    }
    
    func equalButton() -> AnyView {
        return AnyView(
            Button(action: {do {try self.result = self.calculation.calculate()} catch {}} ) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    Text("=")
                        .foregroundColor(Color.white)
                }
            }
        )
    }
    
    func inputs() -> AnyView {
        let spacing: CGFloat = 10
        return AnyView(
            HStack {
                VStack {
                    HStack(spacing: spacing) {
                        numberButton(number: 7)
                        numberButton(number: 8)
                        numberButton(number: 9)
                    }
                    HStack(spacing: spacing) {
                        numberButton(number: 4)
                        numberButton(number: 5)
                        numberButton(number: 6)
                    }
                    HStack(spacing: spacing) {
                        numberButton(number: 1)
                        numberButton(number: 2)
                        numberButton(number: 3)
                    }
                    HStack(spacing: spacing) {
                        numberButton(number: 0)
                    }
                }
                VStack {
                    HStack(spacing: spacing) {
                        signButton(sign: .times)
                        signButton(sign: .divide)
                    }
                    HStack(spacing: spacing) {
                        signButton(sign: .plus)
                        signButton(sign: .minus)
                        equalButton()
                    }
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
