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
    
    func performOperator (operate: String) -> Double {
        if operate == "π" {
            accumulator = M_PI
        } else if operate == "e" {
            accumulator = M_E
        } else if operate == "√" {
            accumulator = sqrt(accumulator)
        }
        
        return accumulator
    }
}