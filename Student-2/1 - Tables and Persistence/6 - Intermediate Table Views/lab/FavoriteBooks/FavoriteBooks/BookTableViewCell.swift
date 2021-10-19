//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Adison Green on 10/18/21.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func update(with book: Book) {
        authorLabel.text = book.author
        genreLabel.text = book.genre
        lengthLabel.text = book.length
        descriptionLabel.text = book.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
