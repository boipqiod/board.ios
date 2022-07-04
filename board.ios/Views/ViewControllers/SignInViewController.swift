//
//  SignInViewController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/04.
//

import Foundation
import UIKit

class SignInViewController: BaseViewController, SignInContract.View{

    var presenter: SignInContract.Presenter?
    
    override func viewDidLoad() {
        
        print("ass")
    }
    @IBAction func signin(_ sender: Any) {
        
        API.share.test(){(response : testRsponse) in
            print("response in vc \(response)")
        }
    }
    
}
extension SignInViewController{
    func setPresenter(_ presenter: BasePresenter) {
        self.presenter = presenter as? SignInContract.Presenter
    }
    
    static func show(_ view: BaseViewController) {
        let sb = UIStoryboard(name: "SignIn", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "signin")  as! SignInViewController
        
        view.view.window?.rootViewController = vc
    }
}
