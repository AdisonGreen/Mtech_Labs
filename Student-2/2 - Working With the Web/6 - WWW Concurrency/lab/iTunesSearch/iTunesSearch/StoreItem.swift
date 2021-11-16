//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Adison Green on 11/15/21.
//

import Foundation

struct SearchResponse: Codable {
    let results: [StoreItem]
}

struct StoreItem: Codable {
    var track: String
    var description: String
    var kind: String
    var artistName: String
    var url: URL
    
    enum CodingKeys: String, CodingKey {
        case track = "trackName"
        case description
        case kind
        case artistName = "artistName"
        case url = "artworkUrl100"
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            track = try values.decode(String.self, forKey: CodingKeys.track)
            artistName = try values.decode(String.self, forKey: CodingKeys.artistName)
            kind = try values.decode(String.self, forKey: CodingKeys.kind)
            url = try values.decode(URL.self, forKey: CodingKeys.url)
        
            if let description = try? values.decode(String.self,
               forKey: CodingKeys.description) {
                self.description = description
            } else {
                let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
                description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
            }
        }
}
