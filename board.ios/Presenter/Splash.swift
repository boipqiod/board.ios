import Foundation


class SplashImlp: SplashContract.Presenter {

    var view: SplashContract.View?
    

    func initSplash(){

        if UserData.share.isSignined() {
            
        }
        else {
            SignInViewController.show(self.view as! BaseViewController)
        }
    }
    
    
}

extension SplashImlp{
    static func setView(_ view: BaseView) {
        let presenter = SplashImlp()
        presenter.view = view as? SplashContract.View
        view.setPresenter(presenter as BasePresenter)
    }
}
