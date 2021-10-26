//
//  ScoreKeeperTableViewController.swift
//  Score Keeper
//
//  Created by Adison Green on 10/19/21.
//

import UIKit

class ScoreKeeperTableViewController: UITableViewController {
    
    var players: [PlayerStats] = [] {
        didSet {
            PlayerStats.saveToFile(players: players)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        players = PlayerStats.loadFromFile()
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
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerContent", for: indexPath) as! PlayerContentTableViewCell
        let player = players[indexPath.row]
        
        cell.update(with: player)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func unwindNewPlayerScreen(segue: UIStoryboardSegue) {
        guard let source = segue.source as? AddPlayersViewController,
              let player = source.player else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            players.remove(at: indexPath.row)
            players.insert(player, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            players.append(player)
        }
        
    }
    
    func updateTheTableView() {
        tableView.reloadData()
    }
    
    @IBSegueAction func editPlayer(_ coder: NSCoder, sender: Any?) -> AddPlayersViewController? {
        
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let player = players[indexPath.row]
        
        return AddPlayersViewController(coder: coder, player: player)
    }

}

extension ScoreKeeperTableViewController: playerViewDelegate {
    func updateScore() {
        players.sort { player1, player2 in
            return player1.score < player2.score
        }
        tableView.reloadData()
    }
    
    
}

