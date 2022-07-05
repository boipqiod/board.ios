//
//  APIContant.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/05.
//

import Foundation
import Alamofire

class APIConstant{
    static let share = APIConstant()
    
    //유저 관련
    let SIGNIN = (URL: APIConfig.baseUrl + "/users/signin", Method: HTTPMethod.post)
    let GETNICKNAME = (URL: APIConfig.baseUrl + "/users/getUserNickName", Method: HTTPMethod.get)
    
    //게시글 관련
    let GET_BOARD_LIST = (URL: APIConfig.baseUrl + "/board/categoryList", Method: HTTPMethod.get)
    
    //댓글 관련
}
