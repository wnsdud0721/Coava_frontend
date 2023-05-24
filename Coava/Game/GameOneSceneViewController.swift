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

class GameOneSceneViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko-KR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        speechRecognizer?.delegate = self
    }
    

    @IBOutlet var questionTextField: UITextField!
    @IBOutlet var responseTextField: UITextField!
    @IBOutlet var post: UIButton!
    
    let synthesizer = AVSpeechSynthesizer()
    
    let apiKey = "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"
    let baseURL = "https://api.openai.com/v1/completions"
    
    @IBAction func moveGameOne(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func post(_ sender: Any) {
        
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
        synthesizer.speak(utterance)
        
    }
    
    func sendChatRequest(prompt: String, completionHandler: @escaping (String?, Error?) -> Void) {
        guard let url = URL(string: baseURL) else {
            completionHandler(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = ["model": "text-davinci-003", "prompt": prompt, "max_tokens": 250, "temperature": 0.7] as [String : Any]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
                return
            }
            
            if let data = data {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                   let jsonDict = jsonObject as? [String: Any],
                   let choices = jsonDict["choices"] as? [[String: Any]],
                   let text = choices.first?["text"] as? String {
                    completionHandler(text, nil)
                    return
                }
            }
            completionHandler(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
        }
        task.resume()
    }
}


