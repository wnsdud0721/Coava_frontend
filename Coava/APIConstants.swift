//
//  APIConstants.swift
//  Coava
//
//  Created by 신재현 on 2023/04/26.
//

import Foundation

struct APIConstants{
    
    enum API {
        static let baseURL  = "http://34.64.45.71:8000"
        
        //userURL = "http://34.64.45.71:8000/api/user/"
        static let userURL  = baseURL + "/api/user/"
        
        //dailyURL = "http://34.64.45.71:8000/api/daily/"
        static let dailyURL  = baseURL + "/api/daily"
        
    }
}
