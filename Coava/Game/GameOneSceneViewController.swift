//
//  serverConnectViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/18.
//

import UIKit
import Alamofire
import Speech
import AVFoundation

struct ChatResponse: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let text: String
}

class GameOneSceneViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko-KR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        speechRecognizer?.delegate = self
        
        buttonClick = UIImage(named: "gameOne_avatar_listen")
        buttonUnClick = UIImage(named: "gameOne_avatar_talking")
    }
    

    @IBOutlet var questionTextField: UITextField!
    @IBOutlet var responseTextField: UITextField!
    @IBOutlet var post: UIButton!
    @IBOutlet var avatarImage: UIImageView!
    
    var isActive = false
    var buttonClick: UIImage?
    var buttonUnClick: UIImage?
    
    let synthesizer = AVSpeechSynthesizer()
    
    let apiKey = "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"
    let baseURL = "https://api.openai.com/v1/completions"
    
    @IBAction func moveGameOne(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
        
    }
    
    @IBAction func post(_ sender: Any) {
        
        if isActive {
            isActive = false
            avatarImage.image = buttonUnClick
        }
        
        else{
            isActive = true
            avatarImage.image = buttonClick
        }
        
        if audioEngine.isRunning { // 현재 음성인식이 수행중이라면
            audioEngine.stop() // 오디오 입력을 중단한다.
            recognitionRequest?.endAudio() // 음성인식 역시 중단
            post.isEnabled = false
            post.setImage(UIImage(named: "Group 21"), for: .normal)
        }
        else {
            startRecording()
            post.setImage(UIImage(named: "Group 215"), for: .normal)
        }
        
        guard let question = questionTextField.text, !question.isEmpty else {
            responseTextField.text = "Please enter a question."
            return
        }
                
        sendChatRequest(prompt: question) { [weak self] (response, error) in
            guard let self = self else { return }
                    
            DispatchQueue.main.async {
                if let error = error {
                    self.responseTextField.text = "Error: \(error)"
                } else if let response = response {
                    self.responseTextField.text = response
                    self.questionTextField.text = nil
                    self.textToSpeech()
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
                self.questionTextField.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }
            if isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                                
                self.post.isEnabled = true
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
        let utterance = AVSpeechUtterance(string: responseTextField.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.4
        utterance.pitchMultiplier = 0.5
        synthesizer.speak(utterance)
    }
    
    func sendChatRequest(prompt: String, completionHandler: @escaping (String?, Error?) -> Void) {
        let headers: HTTPHeaders = ["Authorization": "Bearer \(apiKey)"]
        let parameters: Parameters = [
            "model": "text-davinci-003",
            "prompt": prompt,
            "max_tokens": 250,
            "temperature": 0.7
        ]
            
        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: ChatResponse.self) { response in
                switch response.result {
                case .success(let chatResponse):
                    if let text = chatResponse.choices.first?.text {
                        completionHandler(text, nil)
                        return
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
                
        }
    }
}


