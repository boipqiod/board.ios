//
//  BaseResponse.swift
//  board.ios
//
//  Created by DETION on 2022/06/18.
//

import Foundation

struct BaseResponse<T : Codable> : Codable{
    
}

struct AnyReponse:Codable {}

struct APIResponse<T: Codable>: Codable{
    let responseCode: Int
    let responseMsg: String?
}

struct testRsponse<T : Codable>: Codable{
    let userInfo: userInfo
    
    struct userInfo: Codable{
        let userId: Int
        let email: String
        let name: String
        let nickName: String
    }
}
