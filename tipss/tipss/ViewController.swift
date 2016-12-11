//
//  ViewController.swift
//  tipss
//
//  Created by Wenn Huang on 12/3/16.
//  Copyright © 2016 Wenn Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eaPaidLabel: UILabel!
    @IBOutlet weak var TipsLabel: UILabel!
    @IBOutlet weak var numppl: UILabel!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billTextField: UITextField!
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepperOutlet.wraps = true
        stepperOutlet.autorepeat = true
        stepperOutlet.maximumValue = 100
        // Do any additional setup after loading the view, typically from a nib.
        
        billTextField.delegate = self
        billTextField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
   
    
    @IBAction func tap(sender: AnyObject) {
        view.endEditing(true)

    }
    
    
    @IBAction func stepper(sender: AnyObject) {
        numppl.text =  "\(Int(stepperOutlet.value))"
    }
    @IBAction func calculate(sender: AnyObject) {
        
        //billTextField.becomeFirstResponder()
        
        let tipPercentage=[0.15, 0.2, 0.25]
        
        let bill = Double(billTextField.text!) ?? 0
        
        
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill+tip
        let nump = Double(stepperOutlet.value)
        let eapay = total/nump
        
        
        
        TipsLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
        eaPaidLabel.text = String (format: "$%.2f", eapay)
    
    }

    
}

