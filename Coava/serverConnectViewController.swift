//
//  serverConnectViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/18.
//

import UIKit

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
        do {
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTimee")
            let response = try String(contentsOf: url!)
            
            self.currentTime.text = response
            self.currentTime.sizeToFit()
        }
        catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
    @IBAction func post(_ sender: Any) {
        
        // 전송할 값
        let title = self.userID.text!
        let body = self.name.text!
        let param = "title=\(title)&body=\(body)"
        let paramData = param.data(using: .utf8)
        
        // URL 객체 정의
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        // URLRequest 객체를 정의
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // HTTP 메시지 헤더
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        // URLSession 객체를 통해 전송, 응답값 처리
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 서버가 응답이 없거나 통신이 실패
            if let e = error {
                NSLog("An error has occured: \(e.localizedDescription)")
                return
            }
            // 응답 처리 로직
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    // JSON 결과값을 추출
                    let result = jsonObject["result"] as? String
                    let timestamp = jsonObject["timestamp"] as? String
                    let title = jsonObject["title"] as? String
                    let detail = jsonObject["detail"] as? String
                    
                    // 결과가 성공일 경우
                    if result == "SUCCESS" {
                        self.responseView.text = "아이디: \(title!)" + "\n"
                        + "이름: \(body)" + "\n"
                        + "응답결과: \(result!)" + "\n"
                        + "응답시간: \(timestamp!)" + "\n"
                        + "요청방식: x-www-form-urlencoded"
                    }
                } catch let e as NSError {
                    print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                }
            }
        }
        // POST 전송
        task.resume()
        
        //        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        //            return
        //        }
        //
        //        print("Making api call...")
        //
        //        var request = URLRequest(url: url)
        //
        //        // method, body, headers
        //        request.httpMethod = "POST"
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //        let body: [String: AnyHashable] = [
        //            "userId": 1,
        //            "id": 11,
        //            "title": "Hello From iOS Academy",
        //            "body": "안녕하세요"
        //        ]
        //        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        //
        //        // Make the request
        //        let task = URLSession.shared.dataTask(with: request) { data, _, error in
        //            guard let data = data, error == nil else {
        //                return
        //            }
        //
        //            do {
        //                let response = try JSONDecoder().decode(Response.self, from: data)
        //                print("SUCCESS: \(response)")
        //            }
        //            catch {
        //                print(error)
        //            }
        //        }
        //        task.resume()
        //
        //    }
        //    struct Response: Codable {
        //        let body: String
        //        let id: Int
        //        let title: String
        //        let userId: Int
        //    }
        
    }
}
