//
//  SignIn.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/08.
//

import Foundation

class SignInImpl: SignInContract.Presenter{
    
    var view: SignInContract.View?
    
    func requestSignIn(email: String, password: String) {
        
        print("requestSignIn")
        
        API.share.requestSignIn(email: email, password: password) { (response: SignInResponse) in

            if response.responseCode == 200{
                
                UserData.share.uid = response.userInfo?.userId
                UserData.share.email = response.userInfo?.email
                UserData.share.name = response.userInfo?.name
                UserData.share.nickNmae = response.userInfo?.nickName
                
                self.view?.responseSignIn(success: true)
            }else{
                self.view?.responseSignIn(success: false)
            }
        }
    }
}

extension SignInImpl{
    static func setView(_ view: BaseView) {
        let presenter = SignInImpl()
        presenter.view = view as? SignInContract.View
        view.setPresenter(presenter as BasePresenter)
    }
}
