//
//  AddPlayersViewController.swift
//  Score Keeper
//
//  Created by Adison Green on 10/20/21.
//

import UIKit

class AddPlayersViewController: UIViewController {

    var player: PlayerStats?
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var startingScoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePlayerButtonWasTapped(_ sender: Any) {
        guard let playerName = playerNameTextField.text,
              let startingScoreAsInt = startingScoreTextField.text,
              let newVar = Double(startingScoreAsInt) else { return }
        
        player = PlayerStats(name: playerName, score: newVar)
        performSegue(withIdentifier: "unwindToPlayerScoreScreen", sender: self)
    }
    
    init?(coder: NSCoder, player: PlayerStats?) {
        self.player = player
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.player = nil
        super.init(coder: coder)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
