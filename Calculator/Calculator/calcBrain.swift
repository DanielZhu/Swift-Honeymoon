//
//  calcBrain.swift
//  Calculator
//
//  Created by DanielZhu on 16/5/18.
//  Copyright © 2016年 staydan.com. All rights reserved.
//

import Foundation

class CalcBrain {
    
    // The default value
    var accumulator: Double = 0.0
    
    private var operations: Dictionary<String, Opreation> = [
        "π": Opreation.Constant(M_PI),
        "e": Opreation.Constant(M_E),
        "√": Opreation.UnaryOperation(sqrt),
        "+": Opreation.BinaryOperation({ $0 + $1 }),
        "−": Opreation.BinaryOperation({ $0 - $1 }),
        "÷": Opreation.BinaryOperation({ $0 / $1 }),
        "×": Opreation.BinaryOperation({ $0 * $1 }),
        "±": Opreation.UnaryOperation({ -$0 }),
        "=": Opreation.Equal
    ]
    
    enum Opreation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equal
    }
    
    var pending: PendingBinaryOperatingInfo?
    
    struct PendingBinaryOperatingInfo {
        var firstOperator: Double
        var pendingOperating: ((Double, Double) -> Double)
    }
    
    func executeEqual () {
        if pending != nil {
            accumulator = pending!.pendingOperating(pending!.firstOperator, accumulator)
            pending = nil
        }
    }
    
    func performOperator (symbol: String) -> Double {
        if let operate = operations[symbol] {
            switch operate {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executeEqual()
                pending = PendingBinaryOperatingInfo(firstOperator: accumulator, pendingOperating: function)
            case .Equal:
                executeEqual()
            }
        }
        
        
        return accumulator
    }
}