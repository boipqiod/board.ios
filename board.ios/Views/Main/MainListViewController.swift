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
        MainListImpl.setView(self)
        presenter?.requestMainList(page: 1)
    }
    func responseMainList(response: BoardListResponse) {
        self.respnse = response
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    @IBAction func toAdd(_ sender: Any) {
        NewPostViewController.show(self)
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
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! BoardListCell
        
        let sb = UIStoryboard(name: "BaordDetail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "BaordDetail")  as! BoardDetailViewController
        
        vc.boardId = cell.response?.boardId
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainListViewController{
    static func show(_ view: BaseViewController) {
        
    }
    func setPresenter(_ presenter: BasePresenter) {
        self.presenter = presenter as? MainListPresenter
    }
}
