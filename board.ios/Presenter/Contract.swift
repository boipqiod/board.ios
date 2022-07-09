//
//  Protocol.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/04.
//

import Foundation


protocol BasePresenter{
    static func setView(_ view: BaseView)
}

protocol BaseView{
    func setPresenter(_ presenter: BasePresenter)
    static func show(_ view: BaseViewController)
}

/**
 스플래쉬 뷰 인터페이스
 */
struct SplashContract{
    typealias View = SplashView
    typealias Presenter = SplashPresenter
}
protocol SplashPresenter: BasePresenter{
    func initSplash()
    
    var view: SplashContract.View? { get set }
}
protocol SplashView: BaseView{
    
}

/**
 로그인 뷰 인터페이스
 */
struct SignInContract{
    typealias View = SignInView
    typealias Presenter = SignInPresenter
}
protocol SignInPresenter: BasePresenter{
    func requestSignIn(email: String, password: String)
}
protocol SignInView: BaseView{
    func responseSignIn(success: Bool)
    
    var presenter: SignInContract.Presenter? { get set }
}

/**
 회원가입 뷰
 */
struct SignUpContract{
    typealias View = SignUpView
    typealias Presenter = SignUpPresenter
}
protocol SignUpPresenter: BasePresenter{
    func requestSignUp(email: String, password: String, name: String, nickName: String, _ completion: @escaping (Bool) -> Void)
    func checkEmail(email: String, _ completion: @escaping (Bool) -> Void)
    func checkNickName(nickName: String, _ completion: @escaping (Bool) -> Void)
    
    var view: SignUpContract.View? { get set }
    
}
protocol SignUpView: BaseView{
    func responseSignUp(success: Bool)
    
    var presenter: SignUpContract.Presenter? { get set }
}
