//
//  GameTwoSceneViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/24.
//

import UIKit
import Alamofire
import Speech
import AVFoundation

struct WordResponse: Decodable {
    let choices: [Word]
}

struct Word: Decodable {
    let word: String
}

class GameTwoSceneViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko-KR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        speechRecognizer?.delegate = self
        
        buttonClick = UIImage(named: "gameTwo_avatar_listen")
        buttonUnClick = UIImage(named: "gameTwo_avatar_talking")
        
        do {
            try audioSession.setActive(true)
            try audioSession.setCategory(.playback, mode: .default)
        } catch {
            print("Failed to set audio session category.")
        }
        
    }

    @IBOutlet var userTextField: UITextField!
    @IBOutlet var avatarTextField: UITextField!
    @IBOutlet var post: UIButton!
    @IBOutlet var avatarImage: UIImageView!
    
    var isActive = false
    var buttonClick: UIImage?
    var buttonUnClick: UIImage?
    
    var fixTTS = 1
    
    let synthesizer = AVSpeechSynthesizer()
    let audioSession = AVAudioSession.sharedInstance()
    
    let baseURL = "http://34.64.40.221:8000/api/word/"
    
    
    
    @IBAction func moveGameTwo(_ sender: Any) {
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
            //avatarTextField.text = nil
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
        
        guard let question = userTextField.text, !question.isEmpty else {
            //avatarTextField.text = "Please enter a question."
            return
        }
                
        sendChatRequest(word: question) { [weak self] (response, error) in
            guard let self = self else { return }
                    
            DispatchQueue.main.async {
                if let error = error {
                    self.avatarTextField.text = "Error: \(error)"
                } else if let response = response {
                    /*수정 부분 response.word or response*/
                    self.avatarTextField.text = response.word
                    self.userTextField.text = nil
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
                self.userTextField.text = result?.bestTranscription.formattedString
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
        let utterance = AVSpeechUtterance(string: avatarTextField.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.4
        synthesizer.speak(utterance)
    }
    
//    func sendChatRequest(word: String, completionHandler: @escaping (String?, Error?) -> Void) {
//        guard let url = URL(string: baseURL) else {
//            completionHandler(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        //request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let parameters = ["word": word] as [String : Any]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
//
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                completionHandler(nil, error)
//                return
//            }
//
//            if let data = data {
//                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
//                   let jsonDict = jsonObject as? [String: Any],
//                   let choices = jsonDict["choices"] as? [[String: Any]],
//                   let word = choices.first?["word"] as? String {
//                    completionHandler(word , nil)
//                    return
//                }
//            }
//            completionHandler(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
//        }
//        task.resume()
//    }
    func sendChatRequest(word: String, completionHandler: @escaping (Word?, Error?) -> Void) {
        let headers: HTTPHeaders = ["Content-Type": "application/json"]

        let parameters: Parameters = [
            "word": word
        ]

        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: WordResponse.self) { response in
                switch response.result {
                case .success(let wordResponse):
                    if let word = wordResponse.choices.first {
                        completionHandler(word, nil)
                        return
                    }

                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
}
