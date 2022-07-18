//
//  MainViewController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/05.
//

import Foundation
import UIKit

class MainListViewController: BaseViewController, MainListContract.View{
    
    var presenter: MainListPresenter?
    var respnse: BoardListResponse?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        MainListImlp.setView(self)
        presenter?.requestMainList(page: 1)
    }
    func responseMainList(response: BoardListResponse) {
        self.respnse = response
        
        self.tableView.reloadData()
    }
    
    func setFailList() {
        
    }
    
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return respnse?.boardList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardListCell", for: indexPath) as? BoardListCell
        cell?.setListData(respnse?.boardList?[indexPath.row])

//        print(cell?.Title)
        
        return cell ?? UITableViewCell()
    }
    
    
}

extension MainListViewController{
    static func show(_ view: BaseViewController) {
        
    }
    func setPresenter(_ presenter: BasePresenter) {
        self.presenter = presenter as? MainListPresenter
    }
}
