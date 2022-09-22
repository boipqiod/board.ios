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


/**
 메인화면
 */
struct MainListContract{
    typealias View = MainListView
    typealias Presenter = MainListPresenter
}

protocol MainListPresenter: BasePresenter{
    
    func requestMainList(page: Int)
    
    var view: MainListContract.View? { get set }
}
protocol MainListView: BaseView{
    
    func responseMainList(response: BoardListResponse)
    func setFailList()
    
    var presenter: MainListPresenter? { get set }
}


/**
 detail
 */
struct BoardDetailContract{
    typealias View = BoardDetailView
    typealias Presenter = BoardDetailPresenter
}

protocol BoardDetailPresenter: BasePresenter{
    
    func requestDetail(BoardId: Int)
    
    var view: BoardDetailContract.View? { get set }
}
protocol BoardDetailView: BaseView{
    
    func responseDetail(response: BoardDetailResponse)
    
    var presenter: BoardDetailPresenter? { get set }
}


protocol NewPostContract{
    typealias Presenter = NewPonstPresenter
    typealias View = NewPonstView
}
protocol NewPonstPresenter: BasePresenter{
    func requsetAddPost(title: String, content: String, userId: Int, category: String)
}
protocol NewPonstView: BaseView{
    func responseAddPost(isSuccess: Bool)
}
