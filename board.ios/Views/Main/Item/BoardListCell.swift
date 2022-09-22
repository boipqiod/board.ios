//
//  BoardListCellController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/13.
//

import Foundation
import UIKit

class BoardListCell: UITableViewCell{
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var views: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var comments: UILabel!
    
    var response: BoardListResponse.boardList?
    
    class func register(_ tableView: UITableView){
        let nib = UINib(nibName: String(describing: BoardListCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func setListData(_ response: BoardListResponse.boardList?){
        
        guard response != nil else {
            return
        }
        
        self.response = response
        
        self.Title.text = response?.title
        self.content.text = response?.content
        self.nickName.text = response?.nickName
        self.views.text! = String(describing: response!.views!)
        self.comments.text! = "(\(String(describing: response!.commentCount!)))"
        
        self.date.text = response?.date
        
    }
}
