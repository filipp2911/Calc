//
//  ViewController.swift
//  Calculator
//
//  Created by Filipp Krupnov on 10/9/20.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display!.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            userIsInTheMiddleOfTyping = true
            display.text = digit
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var idea = CalcWork()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            idea.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            idea.performOperation(mathematicalSymbol)
        }
        if let result = idea.result {
            displayValue = result
        }
    }
    
    @IBAction func returnToZero(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        display.text = "0"
    }
}



