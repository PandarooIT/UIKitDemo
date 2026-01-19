//
//  CalculatorButton.swift
//  UIKitBasic
//
//  Created by Macbook on 19/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//


import UIKit

enum CalculatorButtonType {
    case number(Int)
    case operation(Operation)
    case function(Function)
    
    enum Operation: String {
        case add = "+"
        case subtract = "−"
        case multiply = "×"
        case divide = "÷"
        case equals = "="
    }
    
    enum Function: String {
        case clear = "AC"
        case negate = "±"
        case percent = "%"
        case decimal = "."
    }
}

struct CalculatorButton {
    let type: CalculatorButtonType
    var title: String {
        switch type {
        case .number(let value):
            return "\(value)"
        case .operation(let op):
            return op.rawValue
        case .function(let fn):
            return fn.rawValue
        }
    }
    
    var backgroundColor: UIColor {
        switch type {
        case .number, .function(.decimal):
            return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        case .function:
            return UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
        case .operation:
            return UIColor(red: 255/255, green: 159/255, blue: 10/255, alpha: 1.0)
        }
    }
}
