//
//  ViewController.swift
//  Guided Project-Light
//
//  Created by Adison Green on 8/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lightButton: UIButton!
    var lightOn = true
        
    override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
    }
    
   func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
   @IBAction func buttonPressed(_ sender: Any) {
    lightOn.toggle()
    updateUI()
    }
    

        // Do any additional setup after loading the view.
    }




