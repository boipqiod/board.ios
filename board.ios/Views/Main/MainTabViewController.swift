//
//  MainTabViewController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/05.
//

import Foundation
import UIKit

class MainTabViewController: UITabBarController{
    
    static func show(_ view: BaseViewController){
        let sb = UIStoryboard(name: "MainTab", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "tabBar")  as! UITabBarController
        
        view.view.window?.rootViewController = vc
    }
}
