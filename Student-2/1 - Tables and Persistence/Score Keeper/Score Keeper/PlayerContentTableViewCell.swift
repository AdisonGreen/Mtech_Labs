//
//  PlayerContentTableViewCell.swift
//  Score Keeper
//
//  Created by Adison Green on 10/19/21.
//

import UIKit

class PlayerContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var plusMinusStepper: UIStepper!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func update(with player: PlayerStats) {
        playerNameLabel.text = player.name
        let plusMinusStepperInInt = Int(plusMinusStepper.value)
        scoreLabel.text = String(plusMinusStepperInInt)
        plusMinusStepper.value = player.score
    }
    
    @IBAction func stepperWasTapped(_ sender: UIStepper) {
        scoreLabel.text = Int(sender.value).description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
