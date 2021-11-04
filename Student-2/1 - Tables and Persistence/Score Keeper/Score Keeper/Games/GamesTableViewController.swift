//
//  GamesTableViewController.swift
//  Score Keeper
//
//  Created by Adison Green on 10/25/21.
//

import UIKit

class GamesTableViewController: UITableViewController {
    
    var games: [Game] {
        GameController.shared.games
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gamesCell", for: indexPath) as! GameTableViewCell
        let game = games[indexPath.row]
        
        cell.updateGames(with: game)
        
        return cell
    }
    
    @IBSegueAction func gamesToPlayers(_ coder: NSCoder) -> ScoreKeeperTableViewController? {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let game = games[indexPath.row]
            if let viewController = ScoreKeeperTableViewController(coder: coder, game: game) {
                return viewController
            }
        }
        return nil
    }
    
    
}
