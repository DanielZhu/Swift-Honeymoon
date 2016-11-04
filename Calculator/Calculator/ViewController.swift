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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateButtonStyle()
        super.view.backgroundColor = UIColor.grayColor()
    }
    
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
        calcBrain.setOperand(displayValue)
    }
    
    @IBAction func performOperator(sender: UIButton) {
        displayValue = calcBrain.performOperator(sender.currentTitle!)

        userInsertDigitFromMiddle = false
    }
    
    private func updateButtonStyle () {
        // loop the subview: stackview
        for view in self.view.subviews as [UIView] {
            if let stackView = view as? UIStackView {
                // loop the each stackview
                for subStackView in stackView.subviews as [UIView] {
                    if let btn = subStackView as? UIButton {
                        btn.layer.borderWidth = 1
                        btn.layer.borderColor = UIColor.grayColor().CGColor
                    }
                }
            }
        }
    }
}

