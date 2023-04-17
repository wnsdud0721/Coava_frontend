//
//  sttTestViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/17.
//

import UIKit
import Speech
import AVFoundation

class sttTestViewController: UIViewController, SFSpeechRecognizerDelegate {

    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko-KR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @IBOutlet var resultText: UILabel!
    @IBOutlet var startBtn: UIButton!
    
    @IBAction func push(_ sender: Any) {
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
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speechRecognizer?.delegate = self
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
                    self.resultText.text = result?.bestTranscription.formattedString
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
    

}
