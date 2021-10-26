//
//  PlayerContentTableViewCell.swift
//  Score Keeper
//
//  Created by Adison Green on 10/19/21.
//

import UIKit

protocol playerViewDelegate {
    func updateScore()
}

class PlayerContentTableViewCell: UITableViewCell {
    
    var delegate: playerViewDelegate?
    
    var somePlayer: PlayerStats?
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var plusMinusStepper: UIStepper!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func update(with player: PlayerStats) {
        playerNameLabel.text = player.name
        plusMinusStepper.value = player.score
        let plusMinusStepperInInt = Int(plusMinusStepper.value)
        scoreLabel.text = plusMinusStepperInInt.description
        somePlayer = player
    }
    
    @IBAction func stepperWasTapped(_ sender: UIStepper) {
        scoreLabel.text = Int(sender.value).description
        somePlayer?.score = sender.value
        
        delegate?.updateScore()
    }
    
}


