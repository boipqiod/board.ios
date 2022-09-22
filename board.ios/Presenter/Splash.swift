import Foundation


class SplashImpl: SplashContract.Presenter {
    var view: SplashContract.View?
    

    func initSplash(){

        if UserData.shared.isSignin {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                MainTabViewController.show(self.view as! BaseViewController)
            }
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                SignInViewController.show(self.view as! BaseViewController)
            }
        }
    }
    
    
}

extension SplashImpl{
    static func setView(_ view: BaseView) {
        let presenter = SplashImpl()
        presenter.view = view as? SplashContract.View
        view.setPresenter(presenter as BasePresenter)
    }
}
