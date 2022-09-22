//
//  NewPost.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/18.
//

import Foundation

class NewPostImpl: NewPostContract.Presenter{
    
    var view: NewPostContract.View!
    
    static func setView(_ view: BaseView) {
        let p = NewPostImpl()
        p.view = view as? NewPonstView
        view.setPresenter(p)
    }

    func requsetAddPost(title: String, content: String, userId: Int, category: String){
        API.share.registerBoard(title: title, content: content, userId: userId, category: category) { response in
            self.view.responseAddPost(isSuccess: response.responseCode == 200)
            
        }
    }
    
}
