//
//  ViewController.swift
//  CalculatorStanford
//
//  Created by MengDan Zhu on 04/11/2016.
//  Copyright © 2016 Staydan.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var displayLabel: UILabel!
  
  var isUserInputInMiddle = false
  
  var displayValue: Double {
    get {
      return Double(displayLabel.text!)!
    }
    set {
      displayLabel.text = String(newValue)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction private func digitalTouched(_ sender: UIButton) {
    let digit = sender.currentTitle!
    if isUserInputInMiddle {
      let currentDisplayText = displayLabel.text!
      displayLabel.text = currentDisplayText + String(digit)
    }
    else {
      displayLabel.text = digit
    }
    brain.setOperand(operand: displayValue)
    isUserInputInMiddle = true;
  }
  
  private var brain = CalculatorBrain()
  
  @IBAction private func performAction(_ sender: UIButton) {
    isUserInputInMiddle = false
    
    brain.performOperation(symbol: sender.currentTitle!)
    displayValue = brain.result
  }
}
