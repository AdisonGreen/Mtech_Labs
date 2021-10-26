//
//  Games.swift
//  Score Keeper
//
//  Created by Adison Green on 10/25/21.
//

import Foundation

struct Games: Codable {
    var gameName: String
    var allThePlayers: [PlayerStats]
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Score_Keeper").appendingPathExtension("plist")
    
    static func saveToFile(game: [Games]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedGames = try? propertyListEncoder.encode(game)
        try? encodedGames?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Games] {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedGamesData = try? Data(contentsOf: archiveURL),
           let decodedGames = try? propertyListDecoder.decode(Array<Games>.self, from: retrievedGamesData) {
            return decodedGames
        }
        return sampleGames()
    }
    
    static func sampleGames() -> [Games] {
        return [Games(gameName: "First Game", allThePlayers: [PlayerStats(name: "Player 1", score: 0), PlayerStats(name: "Player 2", score: 0)])]
    }
}
