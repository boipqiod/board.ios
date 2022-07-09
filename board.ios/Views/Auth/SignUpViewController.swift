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

    var suerView: SignInViewController?
    
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
    @IBOutlet weak var passwordText: UILabel!
    
    var isEqules:Bool = false
    
    override func viewDidLoad() {
        SignUpImlp.setView(self)
        
        emailInput.keyboardType = .emailAddress
    }
    
    func showView(_ view: UIView){
        self.emailCheckView.isHidden = true
        self.inputNameView.isHidden = true
        self.passwordView.isHidden = true
        
        view.isHidden = false
    }
    
    @IBAction func emailBtn(_ sender: Any) {
        guard let email: String = emailInput.text, emailInput.text?.count != 0 else{
            self.showToast(message: "이메일을 확인해주세요.")
            return
        }
        
        self.emailText.text = ""
        
        presenter?.checkEmail(email: email, { isSuccess in
            if isSuccess {
                self.showView(self.inputNameView)
            } else {
                self.emailText.text = "이미 사용하고 있는 이메일입니다."
            }
        })
    }
    @IBAction func nameBtn(_ sender: Any) {
        guard let nickName: String = nickNameInput.text, nameInput.text?.count != 0, nickNameInput.text?.count != 0 else{
            self.showToast(message: "이름과 별명을 확인해주세요.")
            return
        }
        
        self.nickNameText.text = ""
        
        presenter?.checkNickName(nickName: nickName, { isSuccess in
            if isSuccess {
                self.showView(self.passwordView)
            } else {
                self.nickNameText.text = "이미 사용하고 있는 닉네임입니다."
            }
        })
    }
    @IBAction func nameBackBtn(_ sender: Any) {
        showView(self.emailCheckView)
    }
    @IBAction func passwordBtn(_ sender: Any) {
        
        guard passwordInput.text?.count != 0, checkInput.text?.count != 0 else {
            passwordText.text = "비밀번호를 확인해주세요."
            return
        }
        
        guard passwordInput.text == checkInput.text else {
            passwordText.text = "비밀번호가 서로 일치하지 않습니다."
            return
        }
        
        guard let email: String = emailInput.text, let name: String = nameInput.text, let nickName: String = nickNameInput.text, let password: String = passwordInput.text else {
            passwordText.text = "비밀번호를 확인해주세요."
            return
        }
        
        presenter?.requestSignUp(email: email, password: password, name: name, nickName: nickName, { isSuccess in
            if isSuccess {
                self.showToast(message: "회원가입에 성공했습니다.")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        })
    }
    @IBAction func passwordBackBtn(_ sender: Any) {
        showView(inputNameView)
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
    
    static func show(_ view: BaseViewController) {
        
    }
}
