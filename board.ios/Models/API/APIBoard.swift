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
    
    
}
