//
//  AddNewGameTableViewController.swift
//  Score Keeper
//
//  Created by Adison Green on 11/2/21.
//

import UIKit

class AddNewGameViewController: UIViewController, UITableViewDataSource{
    
    var players = [Player(name: "Player 1", score: 0), Player(name: "Player 2", score: 0)]
    
    @IBOutlet weak var sortPlayersSegmentedControl: UISegmentedControl!
    @IBOutlet weak var whoWinsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playersInGameCell", for: indexPath) as! PlayersInGameTableViewCell
        let player = players[indexPath.row]
        
        cell.updatePlayerCells(with: player)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}
