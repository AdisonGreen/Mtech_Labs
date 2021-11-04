//
//  GameTableViewCell.swift
//  Score Keeper
//
//  Created by Adison Green on 10/25/21.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameOfGame: UILabel!
    @IBOutlet weak var currentWinnerLabel: UILabel!
    
    func updateGames(with game: Game) {
        nameOfGame.text = game.gameName
        currentWinnerLabel.text = game.allThePlayers.description
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
