<br>

# 🗣️Coava

### **유행하는 밈과 유행어를 확인해보세요!!**
### **아바타와 신나는 게임을 즐겨보세요!!**
### **한국어를 쉽게 익힐 수 있도록 도와드릴게요!!**

<br>

## 목차
- [📆 프로젝트 기간](#-프로젝트-기간)
- [⭐️ 프로젝트 소개](#️-프로젝트-소개)
- [📚 구현 기능](#-구현-기능)
- [👩🏻‍💻 Contributors](#-contributors)
- [⚙️ Tech Stack](️#️-tech-stack)
- [🏹 사용한 라이브러리](#-사용한-라이브러리)
- [⚡️ 라이브러리 사용 이유](️#️-라이브러리-사용-이유)
- [🔫 트러블 슈팅](#-트러블-슈팅)
- [🤝🏻 의사결정](#-의사결정)
- [🆙 추후 개발 예정](#-추후-개발-예정)

<br>

## 📆 프로젝트 기간

2022년 08월 01일 ~ 2023년 05월 31일

<br>

## ⭐️ 프로젝트 소개
### 살아있는 한국어를 재미있게 배울수 있는 앱
Coava는 유행어/밈을 쉽게 접할 수 있고, 아바타와의 게임을 통해 한국어를 쉽게 익힐 수 있습니다. <br>

<br>

### 프로젝트 목표
한국어를 배우고 싶은 사람들에게 대화형 아바타를 이용하여 한국어를 쉽고 재미있게 배울 수 있도록 도와주는 것이 목표입니다. <br>

<br>

## 📚 구현 기능
    
1. **홈 페이지**
    - [x] 추천 유행어 목록
    - [x] 추천 밈 목록
    - [x] 출석 체크 기능
    
    <br>
    
2. **유행어/밈 페이지**
    - [x] 추천 유행어 목록
    - [x] 추천 밈 목록
    - [x] 해당 유행어/밈 Web 검색 기능
    
    <br>
    
3. **자유대화 게임 페이지**
    - [x] davinci 모델과 자유대화 기능
    - [x] STT, TTS 기능 (대화 구현)
    - [x] 게임 설명
    
    <br>

4. **끝말잇기 게임 페이지**
    - [x] 자체 서버와 끝말잇기 기능
    - [x] STT, TTS 기능 (대화 구현)
    - [x] 아바타 대답 텍스트로 보여주기 기능
    - [x] 게임 설명
    
    <br>

5. **마이 프로필 페이지**
    - [x] 아이템 장착 기능
    
    <br>
    
<br>

## 👩🏻‍💻 Contributors

| [홍준영](https://github.com/wnsdud0721) | [신재현](https://github.com/jaehyundevdev) | 
| :----------------------------------: | :---------------------------------------: | 
|               ☀️ 리더                  |                ️🌙 부리더                     |  
|              웹뷰 검색                 |                 출석 체크 기능                |  
|              자유대화 게임              |                 출석 체크 UI                 |  
|              끝말잇기                  | 
|            아바타 꾸미기                |

<br>

## ⚙️ <b>Tech Stack</b>

<br>

<img src="https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=Xcode&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=Swift&logoColor=white"/></a>

<br>
<div align="left">

## 🏹 사용한 라이브러리

1. [Alamofire](https://github.com/Alamofire/Alamofire)
2. [OpenAISwift](https://github.com/adamrushy/OpenAISwift)
3. [Tabman](https://github.com/uias/Tabman)
4. [Webkit](https://developer.apple.com/documentation/webkit)
5. [Speech](https://developer.apple.com/documentation/speech/)
6. [AVFoundation](https://developer.apple.com/documentation/avfoundation/)

<br>

## ⚡️ 라이브러리 사용 이유
   
1. ***Alamofire*** <br>
    게임 진행 시 `API 통신을 위해` 사용 <br>
   
2. ***OpenAISwift*** <br>
    아바타와의 자유대화 컨텐츠에 적용할 `text-davinci-003`을 사용하기 위해 사용
   
3. ***Tabman*** <br>
    `상단 탭바 추가`를 위해 사용
   
4. ***Webkit*** <br>
    `유행어/밈 검색 결과`를 쉽게 보여주기 위해 사용
   
5. ***Speech & AVFoundation*** <br>
    `STT, TTS 기능`을 구현하기 위해 사용
 
<br>

## 🔫 트러블 슈팅

### 서버 통신

#### 1. 서버로부터 알맞은 단어를 받지 못함
- 원인 : iOS와 서버의 파라미터의 구조가 서로 다름
  - iOS에서는 choices에 접근한 뒤, 해당 단어를 가져오는 로직으로 작성
  - 백엔드에서는 choices → words → word로 접근하는 로직으로 작성
- 해결 : 백엔드 팀원과 구조를 다시 설계함
  - choices → word로 통일
  ```swift
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
    ```
  <p align="left">
    <img src="https://github.com/wnsdud0721/Coava_frontend/assets/92636626/cda59260-d9af-4a5a-b78d-c547036ac3d8" alt="파라미터 구조" width="250" style="margin-right: 16px;"/>
  </p>

<br>

## 🤝🏻 의사결정

### Davinci 모델의 답변 수준

- 결정 필요 이유 : 모바일 기반 서비스라는 점과 사용자의 원활한 이용을 위해서는 중간점을 찾아야함
    - max_tokens
        - 모델이 생성할 최대 토큰(단어나 문자의 조합)수를 정의
        - 값을 높게 설정하면 더 긴 응답을 받을 수 있지만, 처리 시간도 더 길어질 수 있음
    - temperature
        - 모델의 창의성 또는 무작위성의 정도를 설정
        - 값이 낮으면 더 예측 가능하고 보수적인 응답을 생성하며, 값이 높으면 더 창의적이고 무작위적인 응답을 생성
- 결정 과정 및 결과
    - 10명의 사용자에게 응답 수준과 응답 시간을 위주로 설문 진행
    - max_tokens : 250
    - temperature : 0.7
    ```swift
    //사용 예시
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
    ```

<br>

## 🆙 추후 개발 예정

### 웹뷰 검색 기능 관련
- 현재
    - 웹 페이지내에서 화면 이동이 원활하지 않음
    - 검색 결과로 나온 콘텐츠를 확인한 후, 뒤로가기가 되지 않음
       → 웹 페이지에서 밈/유행어 목록 페이지로 이동하는 뒤로가기 버튼만 존재함
        
- 업데이트
    - 웹 페이지 내에서 이동할 수있는 버튼 생성 (Safari 앱 벤치마킹)

<br>
 
### 아바타 꾸미기 기능 관련
- 현재
    - 버튼 클릭 시, 아바타 이미지가 바뀌는 형식으로 구현
    - 이미지를 Asset 폴더에 저장시켜서 사용하고 있음
    - 종류가 1가지 밖에 없음
    - 상점과 연결이 되어 있지 않음
- 업데이트
    - 자체 DB에 이미지 저장 및 불러오기 → 아이템 추가를 고려
    - 상점과 연결하여 사용자가 구매한 아이템만 장착 가능
 
<br>
