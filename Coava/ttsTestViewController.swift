//
//  ttsTestViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/17.
//

import UIKit
import AVFoundation

class ttsTestViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var text: UILabel!
    
    let synthesizer = AVSpeechSynthesizer()
    let audioSession = AVAudioSession.sharedInstance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do {
            try audioSession.setCategory(AVAudioSession.Category.playback)
        } catch {
            print("Failed to set audio session category")
        }
    }
    
    @IBAction func textToSpeech(_ sender: Any) {
        
        
        let utterance = AVSpeechUtterance(string: text.text!)
        
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        
        utterance.rate = 0.4
        
        do {
            try audioSession.setActive(true)
        } catch {
            print("Failed to activate audio session.")
        }
        
        synthesizer.speak(utterance)
        
    }

}
