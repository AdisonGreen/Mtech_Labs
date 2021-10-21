//
//  ScoreKeeperTableViewController.swift
//  Score Keeper
//
//  Created by Adison Green on 10/19/21.
//

import UIKit

class ScoreKeeperTableViewController: UITableViewController {
    
    var players: [PlayerStats] = [PlayerStats(name: "Player 1", score: 0), PlayerStats(name: "Player 2", score: 0)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
