//
//  YellowViewController.swift
//  Delegates
//
//  Created by Adison Green on 10/4/21.
//

import UIKit

class YellowViewController: UIViewController {

    
    var delegate: ContainsAddButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let customTabBarController = tabBarController as? TabBarController {
            delegate = customTabBarController
        }
    }
    
    @IBAction func plusButtonTapped(_ button: UIButton){
        delegate?.addButtonWasTapped()
    }
 

}
