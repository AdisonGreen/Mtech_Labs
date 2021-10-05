//
//  TabBarController.swift
//  Delegates
//
//  Created by Adison Green on 10/4/21.
//

import UIKit

protocol  ContainsAddButtonDelegate {
    func addButtonWasTapped()
}

class TabBarController: UIViewController, ContainsAddButtonDelegate {
    
    func addButtonWasTapped() {
        print("The Add Button was Tapped! ")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
    }

}
