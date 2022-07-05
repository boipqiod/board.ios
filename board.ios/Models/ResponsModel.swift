//
//  BaseResponse.swift
//  board.ios
//
//  Created by DETION on 2022/06/18.
//

import Foundation

struct APIResponse<T :Codable>: Codable{
    var responseCode: Int
    var responseMsg: String
    var data: T?
    
    func isSuccess() -> Bool{
        if self.responseCode == 200 { return true }
        else { return false }
    }
}

struct SignInResponse: Codable{
    let responseCode: Int
    let responseMsg: String
    let userInfo: userInfo?
    
    struct userInfo: Codable{
        let userId: Int
        let email: String
        let name: String
        let nickName: String
    }
}

struct uid4NickNameRsponse: Codable{
    let responseCode: Int
    let responseMsg: String
    
}
