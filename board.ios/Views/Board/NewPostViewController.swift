//
//  AddPostViewController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/18.
//

import Foundation
import UIKit

class NewPostViewController:BaseViewController, NewPostContract.View{
    
    var presenter: NewPostContract.Presenter!
    var superView: MainListViewController!
    
    
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postContent: UITextField!
    
    override func viewDidLoad() {
        NewPostImpl.setView(self)
    }
    
    @IBAction func submit(_ sender: Any) {
        presenter.requsetAddPost(title: postTitle!.text!, content: postContent!.text!, userId: UserData.shared.uid ?? 1, category: "일상")
    }
    
    func responseAddPost(isSuccess: Bool){
        superView.presenter?.requestMainList(page: 1)
        self.navigationController?.popViewController(animated: true)
    }
    
    func setPresenter(_ presenter: BasePresenter) {
        self.presenter = presenter as? NewPostContract.Presenter
    }
    
    static func show(_ view: BaseViewController) {
        let vc = UIStoryboard(name: "NewPost", bundle: .none).instantiateViewController(withIdentifier: "NewPost") as! NewPostViewController
        vc.superView = view as? MainListViewController
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
