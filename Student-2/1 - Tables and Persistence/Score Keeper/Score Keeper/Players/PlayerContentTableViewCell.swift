//
//  PlayerContentTableViewCell.swift
//  Score Keeper
//
//  Created by Adison Green on 10/19/21.
//

import UIKit

protocol PlayerViewDelegate {
    func updateScore(cell: UITableViewCell, score: Double)
}

class PlayerContentTableViewCell: UITableViewCell {
    
    var delegate: PlayerViewDelegate?
    
    var somePlayer: Player?
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var plusMinusStepper: UIStepper!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func update(with player: Player) {
        playerNameLabel.text = player.name
        plusMinusStepper.value = player.score
        let plusMinusStepperInInt = Int(plusMinusStepper.value)
        scoreLabel.text = plusMinusStepperInInt.description
        somePlayer = player
    }
    
    @IBAction func stepperWasTapped(_ sender: UIStepper) {
        scoreLabel.text = Int(sender.value).description
        
       
        
        delegate?.updateScore(cell: self, score: sender.value)
    }
    
}


