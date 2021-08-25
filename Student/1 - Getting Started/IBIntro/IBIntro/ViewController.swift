//
//  ViewController.swift
//  IBIntro
//
//  Created by Adison Green on 8/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func myButtonTapped(_ sender: Any) {
        view.backgroundColor = .yellow
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myButton.setTitle("This is my new title", for: .normal)
    }


}

