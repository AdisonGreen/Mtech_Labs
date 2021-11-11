import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let baseURLString = "https://itunes.apple.com/search"

var urlComponents = URLComponents(url: URL(string: baseURLString)!, resolvingAgainstBaseURL: true)
urlComponents?.queryItems = [URLQueryItem(name: "term", value: "mission+imposible"), URLQueryItem(name: "media", value: "movie")]

let dataTask = URLSession.shared.dataTask(with: urlComponents!.url!) { data, response, error in
    if let error = error {
        print(error.localizedDescription)
    }
    if let data = data,
       let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}

dataTask.resume()


