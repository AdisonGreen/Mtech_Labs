//
//  AthleteViewController.swift
//  FavoriteAthlete
//
//  Created by Adison Green on 10/6/21.
//

import UIKit

class AthleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leageTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    @IBAction func saveAction(_ sender: Any) {
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let league = leageTextField.text,
              let team = teamTextField.text else { return }
        
              athlete = Athlete(name: name, age: age, league: league, team: team)
              performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
    var athlete: Athlete? = Athlete(name: "Adison", age: 17, league: "Ultra Series", team: "Inkception")
    
    init?(coder: NSCoder, athlete: Athlete?) {
            self.athlete = athlete
            super.init(coder: coder)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    
    func updateView(){
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = String(athlete.age)
            leageTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
    }
}
