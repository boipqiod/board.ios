//
//  APIUser.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/05.
//

import Foundation

extension API{
    func requestSignIn(email: String, password: String, _ completion: @escaping (SignInResponse) -> Void){
    
        var params:[String : Any] = [:]
        
        params["email"] = email
        params["password"] = password
        
        request(APIConstant.share.USER_SIGNIN, params) { (response: SignInResponse) in
            completion(response)
        }
    }
    
    func requestSignUp(email: String, password: String, name: String, nickName: String, _ completion: @escaping (SignUpResponse) -> Void){
        
        var params:[String : Any] = [:]
        
        params["email"] = email
        params["password"] = password
        params["name"] = name
        params["nickName"] = nickName
        
        request(APIConstant.share.USER_SIGNUP, params) { (response : SignUpResponse) in
            completion(response)
        }

    }
    
    func checkEamil(email: String, _ completion: @escaping (AnyResponse) -> Void){
        var params:[String : Any] = [:]
        
        params["email"] = email
        
        request(APIConstant.share.USER_CHECK_EMAIL, params) { (response:AnyResponse) in
            completion(response)
        }
    }
    
    func checkNickName(nickName: String, _ completion: @escaping (AnyResponse) -> Void){
        var params:[String : Any] = [:]
        
        params["nickName"] = nickName
        
        request(APIConstant.share.USER_CHECK_NICKNAME, params) { (response:AnyResponse) in
            completion(response)
        }
    }
    
    func getNickName(){
        
    }
}
