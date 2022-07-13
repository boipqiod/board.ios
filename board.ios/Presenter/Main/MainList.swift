//
//  Main.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/11.
//

import Foundation

class MainListImlp: MainListContract.Presenter{

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

extension MainListImlp{
    static func setView(_ view: BaseView) {
        let presenter = MainListImlp()
        presenter.view = view as? MainListContract.View
        view.setPresenter(presenter)
    }
}
