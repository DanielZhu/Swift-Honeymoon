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
    var result: Double = 0.0
    
    func setOperand (op: Double) {
        accumulator = op

        result = op ?? 0.0
    }
    
    // Calc between two int and float number
    // 2, ., 2, 1, 4 -> 2.214
    func executeDecimal (op1: Double, op2: Double) -> Double {
        return op1 + op2 * 0.1
    }
    
    private var operations: Dictionary<String, Opreation> = [
        "π": Opreation.Constant(M_PI),
        "e": Opreation.Constant(M_E),
        "+": Opreation.BinaryOperation({ $0 + $1 }),
        "−": Opreation.BinaryOperation({ $0 - $1 }),
        "÷": Opreation.BinaryOperation({ $0 / $1 }),
        "×": Opreation.BinaryOperation({ $0 * $1 }),
        ".": Opreation.BinaryOperation({ $0 + $1 * 0.1 }),
        "+/-": Opreation.UnaryOperation({ -$0 }),
        "%": Opreation.UnaryOperation({ $0 / 100 }),
        "√": Opreation.UnaryOperation(sqrt),
        "=": Opreation.Equal,
        "AC": Opreation.ClearAll
    ]
    
    enum Opreation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equal
        case ClearAll
    }
    
    var pending: PendingBinaryOperatingInfo?
    
    struct PendingBinaryOperatingInfo {
        var firstOperator: Double
        var pendingOperating: ((Double, Double) -> Double)
    }
    
    func executeClearAll () {
        accumulator = 0
        result = 0
        pending = nil
    }
    
    func executeEqual () {
        if pending != nil {
            result = pending!.pendingOperating(pending!.firstOperator, accumulator)
            pending = nil
        }
    }
    
    func performOperator (symbol: String) -> Double {
        if let operate = operations[symbol] {
            switch operate {
            case .Constant(let value):
                result = value
            case .UnaryOperation(let function):
                result = function(accumulator)
            case .BinaryOperation(let function):
                executeEqual()
                pending = PendingBinaryOperatingInfo(firstOperator: accumulator, pendingOperating: function)
            case .Equal:
                executeEqual()
            case .ClearAll:
                executeClearAll()
            }
        }
        
        return result
    }
}