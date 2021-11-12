import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

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

func fetchItems(matching query: [String: String], completion:
   @escaping (Result<[StoreItem], Error>) -> Void) {
    var urlComponents = URLComponents(string:
       "https://itunes.apple.com/search")!
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key,
       value: $0.value) }
    let task = URLSession.shared.dataTask(with: urlComponents.url!)
       { (data, response, error) in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            do {
                let decoder = JSONDecoder()
                let searchResponse = try
                   decoder.decode(SearchResponse.self, from: data)
                completion(.success(searchResponse.results))
            } catch {
                completion(.failure(error))
            }
        }
    }

    task.resume()
}

let query = [
    "term": "food",
    "media": "ebook",
    "attribute": "authorTerm",
    "lang": "en_us",
    "limit": "10"
]

fetchItems(matching: query) { (result) in
    switch result {
    case .success(let storeItems):
        storeItems.forEach { item in
            print("""
            Name: \(item.track)
            Artist: \(item.artistName)
            Kind: \(item.kind)
            Description: \(item.description)
            Artwork URL: \(item.url)


            """)
        }
    case .failure(let error):
        print(error)
    }

    PlaygroundPage.current.finishExecution()
}


extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try?
               JSONSerialization.jsonObject(with: self,
               options: []),
            let jsonData = try?
               JSONSerialization.data(withJSONObject:
               jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData,
               encoding: .utf8) else {
                print("Failed to read JSON Object.")
                return
        }
        print(prettyJSONString)
    }
}

