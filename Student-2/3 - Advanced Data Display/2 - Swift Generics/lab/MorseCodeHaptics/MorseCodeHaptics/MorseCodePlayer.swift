//
//  MorseCodePlayer.swift
//  MorseCodeHaptics
//
//  Created by Adison Green on 3/15/22.
//

import Foundation

protocol MorseCodePlayer {
    func play(message: MorseCodeMessage) throws
}
