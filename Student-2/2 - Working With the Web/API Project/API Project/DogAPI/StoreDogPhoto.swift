//
//  storeDogPhoto.swift
//  API Project
//
//  Created by Adison Green on 11/16/21.
//

import Foundation
import UIKit

struct SearchResponse: Codable {
    let results: [StoreDogPhoto]
}

struct StoreDogPhoto: Codable {
    var dogImage: URL
    
    enum CodingKeys: String, CodingKey {
        case dogImage = "https://dog.ceo/api/breeds/image/random"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dogImage = try values.decode(URL.self, forKey: CodingKeys.dogImage)
    }
}
