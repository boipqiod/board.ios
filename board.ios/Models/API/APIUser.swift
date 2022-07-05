//
//  APIUser.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/05.
//

import Foundation

extension API{
    func requestSignIn(email: String, password: String, _ completion: @escaping (SignInResponse) -> Void){
    
        var parms:[String : Any] = [:]
        
        parms["email"] = email
        parms["password"] = password
        
        request(APIConstant.share.SIGNIN, parms) { (response: SignInResponse) in
            completion(response)
        }
    }
    func requestSignUp(){
        
    }
    func getNickName(){
        
    }
}
