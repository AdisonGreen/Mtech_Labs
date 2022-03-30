//
//  MorseCodePlayerbackEvent.swift
//  MorseCodeHaptics
//
//  Created by Adison Green on 3/15/22.
//

import Foundation

enum MorseCodePlaybackEvent {
    case on(TimeInterval)
    case off(TimeInterval)
    
    var duration: TimeInterval {
        switch self {
        case .on(let duration):
            return duration
        case .off(let duration):
            return duration
        }
    }
}
