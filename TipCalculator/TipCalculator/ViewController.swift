//
//  ViewController.swift
//  TipCalculator
//
//  Created by MengDan Zhu on 03/11/2016.
//  Copyright © 2016 Staydan.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentValueLabel: UILabel!
    @IBOutlet weak var finalCostValueLabel: UILabel!
    @IBOutlet weak var costValueTextField: UITextField!
    @IBOutlet weak var tipPercentSlider: UISlider!
    
    var cost: Float? = 0
    var finalCost: Float? = 0
    var tipPercent: Float? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipPercentValueLabel.text = String(tipPercentSlider.value.rounded());
        tipPercent = tipPercentSlider.value.rounded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func costValueEditingChanged(_ sender: UITextField) {
        if let costInputed = sender.text {
            cost = Float(costInputed)
            calcFinalCost()
        }
    }
    
    @IBAction func tipPercentValueSliderChanged(_ sender: UISlider) {
        tipPercentValueLabel.text = String(sender.value.rounded())
        tipPercent = sender.value.rounded()
        calcFinalCost()
    }
    
    func calcFinalCost() {
        var finalCost: Float = 0
        if costValueTextField.text != "" {
            finalCost = cost! * tipPercent! / 100 + cost!
            
            updateFinalLabel(finalCost: finalCost)
        }
    }
    
    func updateFinalLabel(finalCost: Float) {
        if finalCost == 0 {
            self.finalCostValueLabel.text = ""
        }
        else if (costValueTextField.text?.isEmpty)! {
            self.finalCostValueLabel.text = "Invalid Input"
        }
        else {
            self.finalCostValueLabel.text = String(finalCost)
        }
    }
}


