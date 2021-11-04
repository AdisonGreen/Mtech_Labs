//
//  PlayersInGameTableViewCell.swift
//  Score Keeper
//
//  Created by Adison Green on 11/2/21.
//

import UIKit

class PlayersInGameTableViewCell: UITableViewCell {

    @IBOutlet weak var playerLabel: UILabel!
    
    func updatePlayerCells(with player: Player) {
        playerLabel.text = player.name
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
