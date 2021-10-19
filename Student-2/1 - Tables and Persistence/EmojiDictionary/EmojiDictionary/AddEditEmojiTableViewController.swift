//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Adison Green on 10/18/21.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {

    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    var emoji: Emoji? = Emoji(symbol: "", name: "", description: "", usage: "")
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        
            let symbol = symbolTextField.text!
            let name = nameTextField.text ?? ""
            let description = descriptionTextField.text ?? ""
            let usage = usageTextField.text ?? ""
            emoji = Emoji(symbol: symbol, name: name,
               description: description, usage: usage)
       
    }
    
    func containsSingleEmoji(_ textField: UITextField) -> Bool {
        guard let text = textField.text, text.count == 1 else {
            return false
        }
    
        let isEmoji = text.unicodeScalars.first?.properties.isEmojiPresentation ?? false
    
        return isEmoji
    }
    
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
            let descriptionText = descriptionTextField.text ?? ""
            let usageText = usageTextField.text ?? ""
            saveButton.isEnabled = containsSingleEmoji(symbolTextField) &&
               !nameText.isEmpty && !descriptionText.isEmpty &&
               !usageText.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
            title = "Edit Emoji"
        } else {
            title = "Add Emoji"
        }
        
        updateSaveButtonState()
    }
    
    init?(coder: NSCoder, emoji: Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    
}
