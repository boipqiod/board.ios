//
//  BoardDetailViewController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/18.
//

import Foundation
import UIKit

class BoardDetailViewController: BaseViewController, BoardDetailContract.View{
    
    var presenter: BoardDetailPresenter?
    var boardId: Int?
    
    var commentList: [commentList]!
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }
    @IBOutlet weak var boardTitle: UILabel!
    @IBOutlet weak var content: UILabel!
    
    
    override func viewDidLoad() {
        BoardDetailImpl.setView(self)
        presenter?.requestDetail(BoardId: boardId ?? 0)
    }
    
    func responseDetail(response: BoardDetailResponse) {
        self.boardTitle.text = response.title
        self.content.text = response.content
        self.commentList = response.commentList!
        
        tableView.reloadData()
    }
    
}
extension BoardDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let _ = self.commentList {
            return self.commentList.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoardDetailCell", for: indexPath) as? commentCell else {
            return UITableViewCell()
        }
        
        cell.setComment(commentList: self.commentList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}

extension BoardDetailViewController{
    func setPresenter(_ presenter: BasePresenter) {
        self.presenter = presenter as? BoardDetailPresenter
    }
    
    static func show(_ view: BaseViewController) {
        let vc = UIStoryboard(name: "BoardDetail", bundle: .none).instantiateViewController(withIdentifier: "BoardDetail")
        
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

class commentCell: UITableViewCell{
    @IBOutlet weak var commentTitle: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func setComment(commentList: commentList){
        self.commentTitle.text = commentList.nickName
        self.content.text = commentList.comment
        self.date.text = commentList.date
    }
}

