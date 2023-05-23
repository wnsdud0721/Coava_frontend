//
//  serverConnectViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/18.
//

import UIKit
import Alamofire

class serverConnectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var currentTime: UILabel!
    
    @IBOutlet var userID: UITextField!
    
    @IBOutlet var name: UITextField!
    
    @IBOutlet var responseView: UITextView!
    
    
    @IBAction func callCurrentTime(_ sender: Any) {
       
    }
    
    @IBAction func post(_ sender: Any) {
        
        // 1. 전송할 값 준비
        let content = (self.userID.text)!
        let model = "gpt-3.5-turbo"
        let role = "user"
        let param = ["role": role, "content": content]
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        let url = URL(string: "https://api.openai.com/v1/chat/completions")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // 4. HTTP 메세지 헤더 설정
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
            if let e = error {
                NSLog("An error has occured : \(e.localizedDescription)")
                return
            }
            print("Response Data=\(String(data: data!, encoding: .utf8)!)")
            
            // 5-2. 응답 처리 로직이 여기에 들어감
            // 1) 메인 스레드에서 비동기로 처리되도록 한다.
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    // 2) JSON 결과값을 추출한다.
                    let result = jsonObject["result"] as? String
                    //let timestamp = jsonObject["timestamp"] as? String
                    let role = jsonObject["role"] as? String
                    let content = jsonObject["content"] as? String
                    
                    // 3) 결과가 성공일 때에만 텍스트 뷰에 출력한다.
                    if result == "SUCCESS" {
                        self.responseView.text = "GPT : \(role!)" + "\n"
                        + "content : \(content!)" + "\n"
                    }
                } catch let e as NSError {
                    print ("An error has occured while parsing JSONObject : \(e.localizedDescription)")
                }
            }
        }
        // 6. POST 전송
        task.resume()
        
    }
}

extension Bundle {
    var chatGPTAPIKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Property List", ofType: "plist") else {
                fatalError("Couldn't find file 'Property List.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            
            guard let value = plist?.object(forKey: "CHATGPT_KEY") as? String else {
                fatalError("Couldn't find key 'CHATGPT_KEY' in 'Property List.plist'.")
            }
            return value
        }
    }
}
