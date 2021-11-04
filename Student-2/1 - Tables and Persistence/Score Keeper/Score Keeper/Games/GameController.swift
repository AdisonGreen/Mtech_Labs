//
//  GameController.swift
//  Score Keeper
//
//  Created by Adison Green on 11/3/21.
//

import Foundation

class GameController {
    // CRUD - Create, Read, Update, Delete
    static private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private let archiveURL = GameController.documentsDirectory.appendingPathComponent("Score_Keeper_Games").appendingPathExtension("plist")
    
    static let shared = GameController()
    
    var games: [Game] = [] {
        didSet {
            saveToFile(game: games)
        }
    }
    
    init() {
        loadFromFile()
    }
    
    func save(game: Game) {
        if let index = games.firstIndex(where: { existingGame in
            existingGame.id == game.id
        }){
            games[index] = game
        } else {
            games.append(game)
        }
    }
    
    private func saveToFile(game: [Game]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedGames = try? propertyListEncoder.encode(game)
        try? encodedGames?.write(to: archiveURL, options: .noFileProtection)
    }
    
    private func loadFromFile() {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedGamesData = try? Data(contentsOf: archiveURL),
           let decodedGames = try? propertyListDecoder.decode(Array<Game>.self, from: retrievedGamesData) {
            games = decodedGames
        } else {
            games = sampleGames()
        }
    }
    
    private func sampleGames() -> [Game] {
        return [Game(gameName: "First Game", allThePlayers: [Player(name: "Player 1", score: 0)]),
                Game(gameName: "Second Game", allThePlayers: [Player(name: "Player 1", score: 0)])
        ]
    }
}
