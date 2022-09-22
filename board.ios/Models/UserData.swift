//
//  UserData.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/04.
//

import Foundation

class UserData{
    
    static let shared = UserData()
    
    var isSignin: Bool {
        get{
//          return uid != nil
            return true
        }
    }
    
    var uid: Int?
    var name: String?
    var nickNmae: String?
    var email: String?
    
    func setUserData(email: String, password: String, name: String, nickName: String){
        
    }
}
