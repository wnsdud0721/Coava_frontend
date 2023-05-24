//
//  chatGPT2ViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/22.
//

import UIKit
import OpenAISwift
import Speech
import AVFoundation

class chatGPT2ViewController: UIViewController, SFSpeechRecognizerDelegate, UITextFieldDelegate {
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko-KR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @IBOutlet var user: UITextField!
    @IBOutlet var chatGPT: UITextView!
    @IBOutlet var answer: UILabel!
    @IBOutlet var player: UILabel!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var GPT: UITextField!
    
    private var models = [String]()
    
    let synthesizer = AVSpeechSynthesizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.GPT.delegate = self
    }
    
    
    @IBAction func send(_ sender: Any) {
        
        if audioEngine.isRunning { // 현재 음성인식이 수행중이라면
            audioEngine.stop() // 오디오 입력을 중단한다.
            recognitionRequest?.endAudio() // 음성인식 역시 중단
            startBtn.isEnabled = false
            startBtn.setTitle("말하기!", for: .normal)
        }
        else {
            startRecording()
            startBtn.setTitle("말하기 멈추기", for: .normal)
        }
        
        
        let user = (self.user.text)!
        
        if !user.isEmpty {
            models.append(user)
            APICaller.shared.getResponse(input: user) { [weak self] result in
                switch result {
                case .success(let output):
                    self?.models.append(output)
                    DispatchQueue.main.async {
                        self?.GPT.text = output
                        self?.user.text = nil
                        self!.textToSpeech()
                    }
                case .failure:
                    print("Failed")
                }
            }
        }
     
    }
    
    
    
    func startRecording() {
            
            if recognitionTask != nil {
                recognitionTask?.cancel()
                recognitionTask = nil
            }
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.record)
                try audioSession.setMode(AVAudioSession.Mode.measurement)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            }
            catch {}
          
            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            
            let inputNode = audioEngine.inputNode
               
            guard let recognitionRequest = recognitionRequest else {
                fatalError("")
            }
            
            recognitionRequest.shouldReportPartialResults = true
            
            recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
                
                var isFinal = false
                
                if result != nil {
                    print("변환된 음성 : ",result?.bestTranscription.formattedString as Any)
                    self.user.text = result?.bestTranscription.formattedString
                    isFinal = (result?.isFinal)!
                }
                if isFinal {
                                self.audioEngine.stop()
                                inputNode.removeTap(onBus: 0)
                                
                                self.recognitionRequest = nil
                                self.recognitionTask = nil
                                
                                self.startBtn.isEnabled = true
                            }
                        })
                        
                        let recordingFormat = inputNode.outputFormat(forBus: 0)
                        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
                            self.recognitionRequest?.append(buffer)
                        }
                        
                        audioEngine.prepare()
                        
                        do {
                            try audioEngine.start()
                        }
                        catch {}
                    }
    
    func textToSpeech() {
        
        let utterance = AVSpeechUtterance(string: GPT.text!)
        
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        
        utterance.rate = 0.4
        
        synthesizer.speak(utterance)
        
    }
    
    
}
