//
//  ViewController.swift
//  Apple Pie
//
//  Created by Adison Green on 9/10/21.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["pokemon", "small", "book",
    "button", "incandescent", "something"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var CorrectWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    func newRound() {
        
    }

}

