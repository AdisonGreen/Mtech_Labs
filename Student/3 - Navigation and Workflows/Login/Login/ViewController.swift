//
//  ViewController.swift
//  Login
//
//  Created by Adison Green on 9/24/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ForgotUsernameButton: UIButton!
    @IBOutlet weak var ForgotPasswordButton: UIButton!
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBAction func forgotUserNameAction(_ sender: Any) {
        performSegue(withIdentifier: "loginToLanding", sender: sender)
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "loginToLanding", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        if sender == ForgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == ForgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = UsernameTextField.text
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
