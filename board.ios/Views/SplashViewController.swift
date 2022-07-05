import Foundation
import UIKit

class SplashViewController: BaseViewController, SplashContract.View{
    static func show(_ view: BaseViewController) {}
    
    var presenter: SplashContract.Presenter!
    
    override func viewDidLoad() {
        SplashImlp.setView(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.initSplash()
    }
    
    func setPresenter(_ presenter: BasePresenter) {
        self.presenter = presenter as? SplashContract.Presenter
    }
    
}
