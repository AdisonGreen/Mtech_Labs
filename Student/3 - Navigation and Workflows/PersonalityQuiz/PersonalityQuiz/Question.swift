//
//  File.swift
//  PersonalityQuiz
//
//  Created by Adison Green on 9/30/21.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum ResponseType {
    case single, multiple, ranged
}

enum AnimalType {
    case Rockruff, Shinx, Scorbunny, Turtwig
    
    var defintion: String {
        switch self {
        case .Rockruff:
            return "You are an outgoing person that likes to surround yourself with people. You enjoy being around your friends and are a loyal person."
        case .Shinx:
            return "You like to be by yourself and may be a shy or nervous person. You enjoy company only if it is on your own terms and with people you know."
        case .Scorbunny:
            return "You love to play sports. You enjoy being outside and love to be social and outgoing. You are full of energy."
        case .Turtwig:
            return "You are a chill person who does not care what others are doing as long as they do not bug you. You would rather sit on the couch all day than go outside."
        }
    }
}
