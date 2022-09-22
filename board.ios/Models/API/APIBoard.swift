//
//  APIBoard.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/09.
//

import Foundation

extension API{
    
    func getBoardList(pageNo: Int=1, numsOfPages: Int=15, category:String="all", completion: @escaping (BoardListResponse) -> Void){

        var params:[String : Any] = [:]

        params["pageNo"] = pageNo
        params["numsOfPages"] = numsOfPages
        params["category"] = category
        
        request(APIConstant.share.GET_BOARD_LIST, params) { (response:BoardListResponse) in
            completion(response)
        }
        
    }
    
    func getBoardDetail(boardID: Int, completion: @escaping (BoardDetailResponse)-> Void){
        
        var params:[String : Any] = [:]

        params["boardId"] = boardID
        
        request(APIConstant.share.GET_BOARD_DETAIL, params) { (response: BoardDetailResponse) in
            completion(response)
        }
    }
    
    func registerBoard(title: String, content: String, userId: Int, category: String, completion: @escaping (BoardRegisterResponse)-> Void){
        
        var params:[String : Any] = [:]

        params["title"] = title
        params["content"] = content
        params["userId"] = userId
        params["category"] = category

        request(APIConstant.share.REGISTER_BOARD, params) { (response: BoardRegisterResponse) in
            completion(response)
        }
    }
}
