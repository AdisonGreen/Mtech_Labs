//
//  DogAPIViewController.swift
//  API Project
//
//  Created by Adison Green on 11/16/21.
//

import UIKit

class DogAPIViewController: UIViewController {
    
    @IBOutlet weak var randomDogImageView: UIImageView!
    @IBOutlet weak var newImageButton: UIButton!
    
    var DogInfoInstance = DogInfo()
    
    var items = [StoreDogPhoto]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func fetchDogImages() {
        self.items = []
        
        let query = [
            "message": "https://dog.ceo/api/breeds/image/random",
            "status": "success"
        ]
        
        DogInfoInstance.fetchItems(matching: query) { result in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    self.items = info
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
   
    @IBAction func newImageButtonWasTapped(_ sender: Any) {
        fetchDogImages()
        
        guard let item = items.first else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: item.dogImage) { data, _, error in
            if let error = error {
                print(error)
            }
            if let data = data {
                let newImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self.randomDogImageView.image = newImage
                }
            }
        }
        task.resume()
    }
    
}
