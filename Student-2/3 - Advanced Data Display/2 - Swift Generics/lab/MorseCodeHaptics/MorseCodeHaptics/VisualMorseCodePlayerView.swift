//
//  VisualMorseCodePlayerView.swift
//  MorseCodeHaptics
//
//  Created by Adison Green on 3/15/22.
//

import UIKit

class VisualMorseCodePlayerView: UIView, MorseCodePlayer {
    func play(message: MorseCodeMessage) throws {
        
        var timeInterval: TimeInterval = 0
        
        for event in message.playbackEvents {
            switch event {
            case .on:
                Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { _ in
                    self.backgroundColor = .black
                }
            case .off:
                Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { _ in
                    self.backgroundColor = .white
                }
            }
            timeInterval += event.duration
            
            Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { _ in
                self.backgroundColor = .black
            }
        }
    }
}
