//
//  CalculatorBrain.swift
//  CalculatorStanford
//
//  Created by MengDan Zhu on 04/11/2016.
//  Copyright © 2016 Staydan.com. All rights reserved.
//

import Foundation

class CalculatorBrain {
  
  private var pending: pendingBinaryOperationInfo?
  private var accumulator = 0.0
  private var stepsHistory: [AnyObject] = []
  
  func setOperand(operand: Double) {
    accumulator = operand
    stepsHistory.append(operand as AnyObject)
  }
  
  enum Operation {
    case Constant(Double)
    case UnaryOperation((Double) -> Double)
    case BinaryOperation((Double, Double) -> Double)
    case Equals
    case Clear
  }
  
  var operations: Dictionary<String, Operation> = [
    "π": Operation.Constant(M_PI),
    "e": Operation.Constant(M_E),
    "√": Operation.UnaryOperation(sqrt),
    "±": Operation.UnaryOperation({ -$0 }),
    "%": Operation.UnaryOperation({ $0 / 100 }),
    "cos": Operation.UnaryOperation(cos),
    "+": Operation.BinaryOperation({ $0 + $1 }),
    "/": Operation.BinaryOperation({ $0 / $1 }),
    "-": Operation.BinaryOperation({ $0 - $1 }),
    "x": Operation.BinaryOperation({ $0 * $1 }),
    "=": Operation.Equals,
    "C": Operation.Clear
  ]
  
  private func resetCalculator() {
    accumulator = 0.0
    pending = nil;
  }
  
  func performOperation(symbol: String) {
    stepsHistory.append(symbol as AnyObject)

    if let operation = operations[symbol] {
      switch operation {
      case .Constant(let value):
        accumulator = value
      case .UnaryOperation(let function):
        accumulator = function(accumulator)
      case .BinaryOperation(let function):
        executeEqualCalc(isEqualOperand: false)
        pending = pendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
      case .Equals:
        executeEqualCalc(isEqualOperand: true)
      case .Clear:
        resetCalculator()
      }
    }
  }
  
  private func executeEqualCalc(isEqualOperand: Bool) {
    if pending != nil {
      accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
      if isEqualOperand {
        pending = pendingBinaryOperationInfo(binaryFunction: pending!.binaryFunction, firstOperand: accumulator)
      }
      else {
        pending = nil
      }
    }
  }
  
  struct pendingBinaryOperationInfo {
    var binaryFunction: (Double, Double) -> Double
    var firstOperand: Double
  }
  
  var histories: [AnyObject] {
    get {
      return stepsHistory
    }
  }
  var result: Double {
    get {
      return accumulator
    }
  }
}
