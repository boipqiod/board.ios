//
//  Main.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/11.
//

import Foundation

class MainListImpl: MainListContract.Presenter{

    var view: MainListContract.View?
    
    func requestMainList(page: Int) {
        API.share.getBoardList(pageNo: page, numsOfPages: 15, category: "all") { (response:BoardListResponse) in
            
            if response.responseCode == 200 {
                self.view?.responseMainList(response: response)
            }
            else {
                self.view?.setFailList()
            }
        }
    }
}

extension MainListImpl{
    static func setView(_ view: BaseView) {
        let presenter = MainListImpl()
        presenter.view = view as? MainListContract.View
        view.setPresenter(presenter)
    }
}
