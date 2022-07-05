//
//  UserData.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/04.
//

import Foundation

class UserData{
    
    static let share = UserData()
    
    var isSignin: Bool = false
    
    func isSignined() -> Bool{
        return false
    }
    
}
