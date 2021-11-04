//
//  ScoreKeeperTableViewController.swift
//  Score Keeper
//
//  Created by Adison Green on 10/19/21.
//

import UIKit

class ScoreKeeperTableViewController: UITableViewController {
    
    var game: Game {
        didSet {
            GameController.shared.save(game: game)
        }
    }
    
    init?(coder: NSCoder, game: Game){
        self.game = game
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.allThePlayers.sort { $0.score > $1.score }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.allThePlayers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerContent", for: indexPath) as! PlayerContentTableViewCell
        let player = game.allThePlayers[indexPath.row]
        
        cell.update(with: player)
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            game.allThePlayers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func unwindNewPlayerScreen(segue: UIStoryboardSegue) {
        guard let source = segue.source as? AddPlayersViewController,
              let player = source.player else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            game.allThePlayers.remove(at: indexPath.row)
            game.allThePlayers.insert(player, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            game.allThePlayers.append(player)
        }
        
    }
    
    func updateTheTableView() {
        tableView.reloadData()
    }
    
    @IBSegueAction func editPlayer(_ coder: NSCoder, sender: Any?) -> AddPlayersViewController? {
        
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let player = game.allThePlayers[indexPath.row]
        
        return AddPlayersViewController(coder: coder, player: player)
    }

}

extension ScoreKeeperTableViewController: PlayerViewDelegate {
    func updateScore(cell: UITableViewCell, score: Double) {
        if let indexPath = tableView.indexPath(for: cell) {
            game.allThePlayers[indexPath.row].score = score
            game.allThePlayers.sort { $0.score > $1.score }
            tableView.reloadData()
            // Player.saveToFile(players: players)
            
        }
        
    }
}

