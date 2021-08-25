//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Adison Green on 8/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.text = ("This app rocks!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

