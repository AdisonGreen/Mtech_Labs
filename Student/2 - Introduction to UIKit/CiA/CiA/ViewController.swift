//
//  ViewController.swift
//  CiA
//
//  Created by Adison Green on 9/10/21.
//

import UIKit

class ViewController: UIViewController {

    var counter: Int = 0
    @IBAction func clickedButton(_ sender: Any) {
        counter += 1
        print("I clicked the btn \(counter) times!")
        print("Text field says \(TextFieldOutlet.text)")
    }
    @IBAction func switchVauleChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("The switch is on!")
        } else {
            print("The switch is off!")
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    @IBOutlet weak var TextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

