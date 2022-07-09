import Foundation


class SplashImlp: SplashContract.Presenter {
    var view: SplashContract.View?
    

    func initSplash(){

        if UserData.share.isSignin {
            
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                SignInViewController.show(self.view as! BaseViewController)
            }
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
