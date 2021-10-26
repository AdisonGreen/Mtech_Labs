//
//  Players.swift
//  Score Keeper
//
//  Created by Adison Green on 10/20/21.
//

import Foundation

class PlayerStats: Codable {
    
    var name: String
    var score: Double
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Score_Keeper").appendingPathExtension("plist")
    
    init(name: String, score: Double) {
        self.name = name
        self.score = score
    }
    
    static func saveToFile(players: [PlayerStats]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedPlayers = try? propertyListEncoder.encode(players)
        try? encodedPlayers?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [PlayerStats] {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedPlayersData = try? Data(contentsOf: archiveURL),
           let decodedPlayers = try? propertyListDecoder.decode(Array<PlayerStats>.self, from: retrievedPlayersData) {
            return decodedPlayers
        }
        return samplePlayers()
    }
    
    static func samplePlayers() -> [PlayerStats] {
        return [PlayerStats(name: "Player 1", score: 0), PlayerStats(name: "Player 2", score: 0)]
    }
}
