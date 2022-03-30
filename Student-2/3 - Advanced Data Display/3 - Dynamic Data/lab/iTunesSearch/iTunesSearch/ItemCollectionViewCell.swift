//
//  ItemCollectionViewCell.swift
//  iTunesSearch
//
//  Created by Adison Green on 3/21/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell, ItemDisplaying {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
}
