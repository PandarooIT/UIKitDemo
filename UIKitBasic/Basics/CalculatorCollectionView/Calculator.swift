//
//  Calculator.swift
//  UIKitBasic
//
//  Created by Macbook on 19/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//


import Foundation

class Calculator {
    private var displayText: String = "0"
    private var previousValue: Double = 0
    private var currentOperation: CalculatorButtonType.Operation?
    private var shouldResetDisplay = false
    private var hasDecimal = false
    private var isTyping = false
    
    var displayValue: String {
        // decimal
        if isTyping && hasDecimal {
            return formatTypingNumber(displayText)
        }
        // normal
        if let value = Double(displayText) {
            return formatNumber(value)
        }
        return displayText
    }
    
    func input(_ button: CalculatorButton) -> String {
        switch button.type {
        case .number(let num):
            handleNumber(num)
        case .function(.decimal):
            handleDecimal()
        case .function(.clear):
            handleClear()
        case .function(.negate):
            handleNegate()
        case .function(.percent):
            handlePercent()
        case .operation(let op):
            handleOperation(op)
        }
        return displayValue
    }
    
    private func handleNumber(_ number: Int) {
        isTyping = true
        
        if shouldResetDisplay {
            displayText = "\(number)"
            shouldResetDisplay = false
            hasDecimal = false
        } else {
            if displayText == "0" && !hasDecimal {
                displayText = "\(number)"
            } else {
                let plainText = displayText.replacingOccurrences(of: ".", with: "")
                if plainText.count < 9 {
                    displayText = plainText + "\(number)"
                }
            }
        }
    }
    
    private func handleDecimal() {
        isTyping = true
        
        if shouldResetDisplay {
            displayText = "0,"
            shouldResetDisplay = false
            hasDecimal = true
        } else {
            if !hasDecimal {
                displayText += ","
                hasDecimal = true
            }
        }
    }
    
    private func handleClear() {
        displayText = "0"
        previousValue = 0
        currentOperation = nil
        shouldResetDisplay = false
        hasDecimal = false
        isTyping = false
    }
    
    private func handleNegate() {
        if let value = Double(displayText.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: ".")) {
            let negated = -value
            displayText = String(negated).replacingOccurrences(of: ".", with: ",")
            hasDecimal = displayText.contains(",")
            isTyping = false
        }
    }
    
    private func handlePercent() {
        if let value = Double(displayText.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: ".")) {
            let percent = value / 100
            displayText = String(percent).replacingOccurrences(of: ".", with: ",")
            hasDecimal = displayText.contains(",")
            isTyping = false
        }
    }
    
    private func handleOperation(_ operation: CalculatorButtonType.Operation) {
        guard let currentValue = Double(displayText.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: ".")) else { return }
        
        isTyping = false
        
        if operation == .equals {
            if let prevOp = currentOperation {
                let result = performCalculation(previousValue, currentValue, prevOp)
                displayText = String(result).replacingOccurrences(of: ".", with: ",")
                hasDecimal = displayText.contains(",")
                currentOperation = nil
                shouldResetDisplay = true
            }
        } else {
            if let prevOp = currentOperation {
                let result = performCalculation(previousValue, currentValue, prevOp)
                displayText = String(result).replacingOccurrences(of: ".", with: ",")
                hasDecimal = displayText.contains(",")
                previousValue = result
            } else {
                previousValue = currentValue
            }
            currentOperation = operation
            shouldResetDisplay = true
        }
    }
    
    private func performCalculation(_ lhs: Double, _ rhs: Double, _ operation: CalculatorButtonType.Operation) -> Double {
        switch operation {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .multiply:
            return lhs * rhs
        case .divide:
            return rhs != 0 ? lhs / rhs : 0
        case .equals:
            return rhs
        }
    }
    
    private func formatTypingNumber(_ text: String) -> String {
        let components = text.split(separator: ",")
        
        if components.count == 2 {
            let integerPart = String(components[0])
            let decimalPart = String(components[1])
            
            if let intValue = Int(integerPart) {
                let formatted = formatIntegerWithDots(intValue)
                return formatted + "," + decimalPart
            }
        } else if components.count == 1 && text.hasSuffix(",") {
            if let intValue = Int(components[0]) {
                let formatted = formatIntegerWithDots(intValue)
                return formatted + ","
            }
        }
        
        return text
    }
    
    private func formatNumber(_ value: Double) -> String {
        let isNegative = value < 0
        let absValue = abs(value)
        
        if absValue.truncatingRemainder(dividingBy: 1) == 0 {
            let intValue = Int(absValue)
            let formatted = formatIntegerWithDots(intValue)
            return isNegative ? "-" + formatted : formatted
        } else {
            let integerPart = Int(absValue)
            let decimalPart = absValue - Double(integerPart)
            
            let intFormatted = formatIntegerWithDots(integerPart)
            
            // Format 'decimal'
            let decimalString = String(format: "%.8f", decimalPart)
            let decimalDigits = decimalString.dropFirst(2)
            
            // erase last '0'
            var trimmed = String(decimalDigits)
            while trimmed.hasSuffix("0") {
                trimmed = String(trimmed.dropLast())
            }
            
            let result = trimmed.isEmpty ? intFormatted : intFormatted + "," + trimmed
            return isNegative ? "-" + result : result
        }
    }
    
    // add dots when number > 1000
    private func formatIntegerWithDots(_ number: Int) -> String {
        let numberString = String(number)
        var result = ""
        var count = 0
        // right to left
        for char in numberString.reversed() {
            if count == 3 {
                result = "." + result
                count = 0
            }
            result = String(char) + result
            count += 1
        }
        
        return result
    }
}
