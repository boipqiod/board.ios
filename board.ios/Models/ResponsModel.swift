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

struct BaseResponse: Codable{
    let responseCode: Int
    let responseMsg: String
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

struct SignUpResponse: Codable{
    let responseCode: Int
    let responseMsg: String
    let userId: Int?
}

struct uid4NickNameRsponse: Codable{
    let responseCode: Int
    let responseMsg: String
    
}

struct BoardListResponse: Codable{
    let responseCode: Int
    let responseMsg: String
    let boardList: [boardList]?
    
    struct boardList: Codable{
        let boardId: Int
        let title: String
        let nickName: String
        let date: Date
        let views: Int
        let commentCount: Int
    }
}
