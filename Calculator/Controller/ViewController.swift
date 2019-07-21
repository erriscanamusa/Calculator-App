//
//  ViewController.swift
//  Calculator
//  Created by Erris Canamusa on 7/21/19.

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber : Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
            
        }
    }
    
    private var calculator = CalculatorLogic() // global var; instance of CalculatorLogic; private
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            
            }
            
           
        }
    }
    
    

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
     
       if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
                
            }
            
            
            
        }
    
    }

}


