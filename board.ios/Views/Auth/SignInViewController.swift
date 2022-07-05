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
        
    }
    @IBAction func toSignUp(_ sender: Any) {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "signUp") as? SignUpViewController else{
            print("Aa")
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func signin(_ sender: Any) {
        
        guard let email = self.email.text else { return }
        guard let password = self.password.text else { return }
        
        if email.count == 0 || password.count == 0 {
            self.showToast(message: "아이디와 비밀번호를 확인해주세요.")
            return
        }
        
        API.share.requestSignIn(email: email, password: password) { (response: SignInResponse) in

            if response.responseCode == 200{
                self.showToast(message: "로그인 성공.")
                MainTabViewController.show(self)
            }else{
                
            }
            
            print("response \n \(response)")

        }
        
//        var params: [String:Any] = [:]
////        params["userId"] = Int(1)
//
//        API.share.request(APIConstant.share.GET_BOARD_LIST, params){(response : uid4NickNameRsponse) in
//            print("response in vc\n \(response)")
//        }
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
