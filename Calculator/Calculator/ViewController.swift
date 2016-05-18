//
//  ViewController.swift
//  Calculator
//
//  Created by DanielZhu on 16/5/16.
//  Copyright © 2016年 staydan.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var calcBrain = CalcBrain()
    
    var userInsertDigitFromMiddle = false
    
    @IBOutlet weak var display: UILabel!
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func digitButton(sender: UIButton) {
        let digit = sender.currentTitle!
        if digit == "0" && !userInsertDigitFromMiddle {
            display.text = digit
        } else {
            if !userInsertDigitFromMiddle {
                display.text = digit
            } else {
                display.text = display.text! + digit
            }
            userInsertDigitFromMiddle = true
        }
        calcBrain.accumulator = displayValue
//        print("Touched \(digit) digit")
    }
    
    @IBAction func performOperator(sender: UIButton) {
        displayValue = calcBrain.performOperator(sender.currentTitle!)

        userInsertDigitFromMiddle = false
    }
}

