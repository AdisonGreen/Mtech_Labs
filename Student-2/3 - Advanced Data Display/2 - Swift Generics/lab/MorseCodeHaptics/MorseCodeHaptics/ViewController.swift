
import UIKit
import CoreHaptics

class ViewController: UIViewController {
    
    enum PlayerMode: Int {
        case both, haptic, visual
    }
    
    var visualPlayerView: VisualMorseCodePlayerView {
        return view as! VisualMorseCodePlayerView
    }
    
    var activeMorseCodePlayers: [MorseCodePlayer] = []
    var hapticsPlayer: HapticsMorseCodePlayer?
    
    @IBOutlet var playerModeSegmentedControl: UISegmentedControl!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.text = "sos"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
            if CHHapticEngine.capabilitiesForHardware().supportsHaptics ==
               true {
                do {
                    hapticsPlayer = try HapticsMorseCodePlayer()
                    configurePlayers(mode: .both)
                } catch {
                    presentErrorAlert(title: "Haptics Error",
                       message: "Failed to start haptics engine.")
                    configurePlayers(mode: .visual)
                }
            } else {
                configurePlayers(mode: .visual)
            }
    }
    
    
    @IBAction func playerModeSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        let mode = PlayerMode(rawValue: sender.selectedSegmentIndex)!
        configurePlayers(mode: mode)
    }
    
    @IBAction func playMessage(_ sender: Any) {
        messageTextField.resignFirstResponder()
        if let myMessage = messageTextField.text {
            try? visualPlayerView.play(message: MorseCodeMessage(message: myMessage)!)
        }
    }
    
    func presentErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func configurePlayers(mode: PlayerMode) {
        switch (mode, hapticsPlayer) {
        case (.haptic, let haptics?):
            activeMorseCodePlayers = [haptics]
        case (.both, let haptics?):
            activeMorseCodePlayers = [haptics, visualPlayerView]
        default:
            activeMorseCodePlayers = [visualPlayerView]
        }
    }
}

