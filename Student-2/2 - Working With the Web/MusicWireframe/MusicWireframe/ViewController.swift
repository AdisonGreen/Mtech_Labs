//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Adison Green on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    var isPlaying = true {
        didSet {
            playButton.isSelected = isPlaying
        }
    }
    
    @IBOutlet weak var albumView: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var forwardsButton: UIButton!
    @IBOutlet weak var backwordsShadow: UIView!
    @IBOutlet weak var playShadow: UIView!
    @IBOutlet weak var forwardsShadow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [backwordsShadow, playShadow, forwardsShadow].forEach { view in
            view?.layer.cornerRadius = view!.frame.height / 2
            view?.clipsToBounds = true
            view?.alpha = 0.0
        }
    }

    @IBAction func playPauseButtonTapped(_ sender: Any) {
        isPlaying.toggle()
        
        if isPlaying {
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: [], animations: {
                self.albumView.transform = CGAffineTransform.identity
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }

    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = backwordsShadow
        case playButton:
            buttonBackground = playShadow
        case forwardsButton:
            buttonBackground = forwardsShadow
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = backwordsShadow
        case playButton:
            buttonBackground = playShadow
        case forwardsButton:
            buttonBackground = forwardsShadow
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.0
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        } completion: { _ in
            buttonBackground.transform = CGAffineTransform.identity
        }
        
        
        
    }
    
}

