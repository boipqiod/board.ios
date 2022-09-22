//
//  BoardDetail.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/18.
//

import Foundation

class BoardDetailImpl: BoardDetailContract.Presenter{
    
    var view: BoardDetailContract.View?
    
    func requestDetail(BoardId: Int) {
        API.share.getBoardDetail(boardID: BoardId) { (response:BoardDetailResponse) in
            self.view?.responseDetail(response: response)
        }
    }
}
extension BoardDetailImpl{
    static func setView(_ view: BaseView) {
        let presenter = BoardDetailImpl()
        presenter.view = view as? BoardDetailContract.View
        view.setPresenter(presenter as BasePresenter)
    }
}
