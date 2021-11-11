//
//  ViewController.swift
//  Contest
//
//  Created by Adison Green on 11/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    var myVar = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        
        
        
        if emailTextField.text == "" {
            let noInput = CGAffineTransform(translationX: 5, y: 0)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.01, options: []) {
                self.emailTextField.transform = noInput
            } completion: { _ in
                self.emailTextField.transform = CGAffineTransform.identity
            }
            myVar += 1
            
        } else {
            performSegue(withIdentifier: "mySegue", sender: nil)
        }

    }
    
}

