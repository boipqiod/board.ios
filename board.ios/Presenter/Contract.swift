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
}
protocol SplashView: BaseView{
    
}

/**
 로그인 뷰 인터페이스
 */
struct SignInContract{
    typealias View = SignView
    typealias Presenter = SignInPresenter
}
protocol SignInPresenter: BasePresenter{

}
protocol SignView: BaseView{
    
}
