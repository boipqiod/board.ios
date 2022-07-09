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
        
        request(APIConstant.share.USER_SIGNIN, parms) { (response: SignInResponse) in
            completion(response)
        }
    }
    
    func requestSignUp(email: String, password: String, name: String, nickName: String, _ completion: @escaping (SignUpResponse) -> Void){
        
        var parms:[String : Any] = [:]
        
        parms["email"] = email
        parms["password"] = password
        parms["name"] = name
        parms["nickName"] = nickName
        
        request(APIConstant.share.USER_SIGNUP, parms) { (response : SignUpResponse) in
            completion(response)
        }

    }
    
    func checkEamil(email: String, _ completion: @escaping (BaseResponse) -> Void){
        var parms:[String : Any] = [:]
        
        parms["email"] = email
        
        request(APIConstant.share.USER_CHECK_EMAIL, parms) { (response:BaseResponse) in
            completion(response)
        }
    }
    
    func checkNickName(nickName: String, _ completion: @escaping (BaseResponse) -> Void){
        var parms:[String : Any] = [:]
        
        parms["nickName"] = nickName
        
        request(APIConstant.share.USER_CHECK_NICKNAME, parms) { (response:BaseResponse) in
            completion(response)
        }
    }
    
    func getNickName(){
        
    }
}
