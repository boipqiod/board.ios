//
//  BaseNavigationViewController.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/05.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactivePopGestureRecognizer?.delegate = nil

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground() // With a red background, make the title more readable.
            self.navigationBar.standardAppearance = appearance
            self.navigationBar.scrollEdgeAppearance = appearance
            self.navigationBar.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        } else {
        }
        
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
