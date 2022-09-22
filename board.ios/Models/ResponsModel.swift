//
//  BaseResponse.swift
//  board.ios
//
//  Created by DETION on 2022/06/18.
//

import Foundation



protocol APIResponse: Codable{
    var responseCode: Int { get }
    var responseMsg: String { get }
}

class BaseResponse{
    var data: APIResponse!
    
    func isSucess() -> Bool{
        return data?.responseCode == 200
    }
}

struct AnyResponse: APIResponse{
    let responseCode: Int
    let responseMsg: String
}


struct SignInResponse: APIResponse{
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

struct SignUpResponse: APIResponse{
    let responseCode: Int
    let responseMsg: String
    let userId: Int?
}

struct uid4NickNameRsponse: APIResponse{
    let responseCode: Int
    let responseMsg: String
    
}

struct BoardListResponse: APIResponse{
    let responseCode: Int
    let responseMsg: String
    let boardList: [boardList]?
    
    struct boardList: Codable{
        let boardId: Int?
        let title: String?
        let content: String?
        let category: String?
        let nickName: String?
        let date: String?
        let views: Int?
        let commentCount: Int?
    }
}

struct BoardDetailResponse: APIResponse{
    let responseCode: Int
    let responseMsg: String
    let title: String
    let content: String
    let nickName: String
    let category: String
    let date: String
    let commentList: [commentList]?
}
struct commentList:Codable {
    let commentId: Int
    let nickName: String
    let date: String
    let comment: String
}
struct BoardRegisterResponse: APIResponse{
    let responseCode: Int
    let responseMsg: String
    let BoardId: Int?
}
