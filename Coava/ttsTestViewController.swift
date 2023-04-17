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
    
    let synthesizer = AVSpeechSynthesizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func textToSpeech(_ sender: Any) {
        
        
        let utterance = AVSpeechUtterance(string: textField.text!)
        
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        
        utterance.rate = 0.4
        
        synthesizer.speak(utterance)
        
    }
    
    

}
