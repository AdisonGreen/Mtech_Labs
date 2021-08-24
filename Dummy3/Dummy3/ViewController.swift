//
//  ViewController.swift
//  Dummy3
//
//  Created by Adison Green on 8/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func showMeMyNameButtonTapped(_ sender: Any) {
        if nameLabel.text != "Adison Green" {
            nameLabel.text = "Adison Green"
            nameLabel.backgroundColor =
                .systemPink
        }
        nameLabel.text = "Adison Green"
        nameLabel.backgroundColor = .systemPink
    }
    
    
    
    
    
    

}

