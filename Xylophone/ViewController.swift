//
//  ViewController.swift
//  Xylophone
//
//  Created by Lesya Kotty on 30.03.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(button: sender)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(button: UIButton) {
        let url = Bundle.main.url(forResource: button.currentTitle!, withExtension: "wav")
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
                
    }
}

