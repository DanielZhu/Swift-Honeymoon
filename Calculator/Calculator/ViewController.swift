//
//  ViewController.swift
//  Calculator
//
//  Created by DanielZhu on 16/5/16.
//  Copyright © 2016年 staydan.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
    var userInsertDigitFromMiddle = false
    
    @IBOutlet weak var display: UILabel!
    
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
//        print("Touched \(digit) digit")
    }
    
    @IBAction func performOperator(sender: UIButton) {
        display.text = String(M_PI)
        userInsertDigitFromMiddle = false
    }
}

