//
//  ViewController.swift
//  firstTableView
//
//  Created by Adison Green on 10/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dates = [Date]()
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        dates.append(Date())
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        let date = dates[indexPath.row]
        cell.textLabel?.text = "\(date)"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

