//
//  secondTestViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/21.
//

import UIKit
import Alamofire

class secondTestViewController: UIViewController {
    
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var userId: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var responseView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
//        let param: Parameters = [
//            "userId": "Hong gil dong",
//            "name": "홍길동"
//        ]
//        let alamo = Alamofire.request(url!, method: .post, parameters: param, encode: URLEncoding.httpBody)
//
//        alamo.responseJSON() { response in
//            print("JSON_Alamo=\(response.result.value!)")
//            if let jsonObject = response.result.value as? [String:Any]{
//                print("userId = \(jsonObject["userId"]!)")
//                print("name = \(jsonObject["name"]!)")
//            }
//        }
    }
    
    @IBAction func callCurrentTime(_ sender: Any) {
        do {
            // 1.URL 설정 및 GET 방식으로 API 호출
            let url = URL(string: "http://swiftapi.rubypapter.co.kr:2029/practice/currentTime")
            let response = try String(contentsOf: url!)
            
            // 2. 읽어온 값을 레이블에 표시
            self.currentTime.text = response
            self.currentTime.sizeToFit()
        }
        catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
    @IBAction func post(_ sender: Any) {
        
        // 1. 전송할 값 준비
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = "userId=\(userId)&name=\(name)"
        let paramData = param.data(using: .utf8)
        
        // 2. URL 객체 정의
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        
        // 3. URLRequest 객체를 정의하고, 요청 내용을 담는다.
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // 4. HTTP 메세지 헤더 설정
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
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
                    let timestamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    
                    // 3) 결과가 성공일 때에만 텍스트 뷰에 출력한다.
                    if result == "SUCCESS" {
                        self.responseView.text = "아이디 : \(userId!)" + "\n"
                                                + "이름 : \(name!)" + "\n"
                            + "응답결과 : \(result!)" + "\n"
                            + "응답방식 : \(timestamp!)" + "\n"
                            + "요청방식 : x-www-form-urlencoded"
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
