//
//  AppDelegate.swift
//  leboncoin
//
//  Created by HONORE Adeline on 11/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       //Create a window that is the same size as the screen
       window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = AdSplitViewController()
        self.window!.rootViewController = viewController
        self.window!.makeKeyAndVisible()
        
        return true
    }
}

