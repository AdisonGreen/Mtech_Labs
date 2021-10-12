import UIKit

class AthleteTableViewController: UITableViewController {
    
   
    
    @IBSegueAction func addAthlete(_ coder: NSCoder, sender: Any?) -> AthleteViewController? {
        return AthleteViewController(coder: coder, athlete: nil)
    }
    
    
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteViewController? {
        let athleteToEdit: Athlete?
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            athleteToEdit = athletes[indexPath.row]
        } else {
            athleteToEdit = nil
        }
        return AthleteViewController(coder: coder, athlete: athleteToEdit)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard
            let athleteFormViewController = segue.source as? AthleteViewController,
            let athlete = athleteFormViewController.athlete
        else {
            return
        }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = athlete
        } else {
            athletes.append(athlete)
        }
    }
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }
    
    

    var athletes: [Athlete] = []
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }
}
