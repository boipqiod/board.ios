import Foundation
import UIKit

class SplashViewController: BaseViewController, SplashContract.View{
    
    static func show(_ view: BaseViewController) {
        let sb = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "splash")  as! SplashViewController

        view.present(vc, animated: true)
    }

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
