//
//  DetailViewController.swift
//  MoreTableViews
//
//  Created by Adison Green on 10/12/21.
//

import UIKit

protocol DetailViewControllerDelegate {
    func didCreateNewPetName(_: PetName)
    func didEditPetName(_: PetName)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var animalTextField: UITextField!
    
    var delegate: DetailViewControllerDelegate?
    var petName: PetName?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add New Pet Name"
        
        nameTextField.text = petName?.name
        animalTextField.text = petName?.animal
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, let animal = animalTextField.text
            else { return }
        
        if let oldPetname = petName {
            let editedPetName = PetName(id: oldPetname.id, name: name, animal: animal)
            delegate?.didEditPetName(editedPetName)
        } else {
            let newPetName = PetName(id: UUID(), name: name, animal: animal)
            delegate?.didCreateNewPetName(newPetName)
        }
        
        
        
        navigationController?.popViewController(animated: true)
    }
    
}
