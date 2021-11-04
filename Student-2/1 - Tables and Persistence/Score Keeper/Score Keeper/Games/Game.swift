//
//  Games.swift
//  Score Keeper
//
//  Created by Adison Green on 10/25/21.
//

import Foundation

struct Game: Codable {
    var gameName: String
    var allThePlayers: [Player]
    let id = UUID()
    
//    init(gameName: String, allThePlayers: [Player]) {
//        self.gameName = gameName
//        self.allThePlayers = allThePlayers
//    }
   
}
