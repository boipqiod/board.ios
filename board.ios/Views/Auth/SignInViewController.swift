//
//  SignInViewController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/04.
//

import Foundation
import UIKit

class SignInViewController: BaseViewController, SignInContract.View{

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var presenter: SignInContract.Presenter?
    
    override func viewDidLoad() {
        
        SignInImpl.setView(self)
        
        //네비게이션바 삭제
        self.navigationController?.navigationBar.isHidden = true
        //키보드 설정
        email.keyboardType = .emailAddress
    }
    
    func responseSignIn(success: Bool) {
        if success {
            self.showToast(message: "로그인 성공.")
            MainTabViewController.show(self)
        } else {
            self.showToast(message: "로그인 실패 \n 로그인 정보를 확인해 주세요.")
        }
    }
    
    @IBAction func signin(_ sender: Any) {
        
        guard let email = self.email.text else { return }
        guard let password = self.password.text else { return }
        
        if email.count == 0 || password.count == 0 {
            self.showToast(message: "아이디와 비밀번호를 확인해주세요.")
            return
        }
        
        presenter?.requestSignIn(email: email, password: password)
        
    }
    
}
extension SignInViewController{
    func setPresenter(_ presenter: BasePresenter) {
        self.presenter = presenter as? SignInContract.Presenter
    }
    
    static func show(_ view: BaseViewController) {
        let sb = UIStoryboard(name: "Sign", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "signin")  as! BaseNavigationController
        
        view.view.window?.rootViewController = vc
    }
}
