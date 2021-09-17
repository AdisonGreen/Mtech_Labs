//
//  ViewController.swift
//  Calculator
//
//  Created by Adison Green on 9/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBAction func buttonWasTapped(_ sender: UIButton) {
        print("\(sender.titleLabel!.text!) was tapped")
       
        guard let outputNumber = sender.titleLabel?.text else{
            return
        }
        
        switch outputNumber {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            print("It is a number")
            display.text = outputNumber
        case "+", "/", "=", "x", "-":
            let firstNumber = Double(display.text!)
            let secondNumber = Double(display.text!)
            let answer = firstNumber! + secondNumber!
            display.text = outputNumber
            display.text = String(answer)
        case "AC":
            print("That is a clear button")
            display.text = outputNumber
        case "%", ".", "+/-":
            print("Other")
            display.text = outputNumber
        default:
            print("What is it?")
            display.text = outputNumber
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }



}

