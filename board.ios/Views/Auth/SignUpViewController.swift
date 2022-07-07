//
//  SignUpViewController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/05.
//

import Foundation
import UIKit

class SignUpViewController: BaseViewController, SignUpContract.View {

    
    var presenter: SignUpContract.Presenter?
    
    
    @IBOutlet weak var emailCheckView: UIView!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var emailText: UILabel!
    
    @IBOutlet weak var inputNameView: UIView!
    @IBOutlet weak var nickNameInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var nickNameText: UILabel!
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var checkInput: UITextField!
    var isEqules:Bool = false
    
    
    @IBAction func emailBtn(_ sender: Any) {
        emailCheckView.isHidden = true
        inputNameView.isHidden = false
    }
    @IBAction func nameBtn(_ sender: Any) {
        inputNameView.isHidden = true
        passwordView.isHidden = false
    }
    @IBAction func passwordBtn(_ sender: Any) {
        self.showAlert(message: "테스트") {
            
        }
    }
    
    func responseSignUp(success: Bool) {
        if success{
            self.dismiss(animated: true)
            self.showToast(message: "회원가입에 성공했습니다! 로그인해주세요.")
        } else {
        }
    }
    
}

extension SignUpViewController{
    func setPresenter(_ presenter: BasePresenter) {
        self.presenter = presenter as? SignUpContract.Presenter
    }
    
    static func show(_ view: BaseViewController) { }
}
