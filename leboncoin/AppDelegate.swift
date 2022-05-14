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
       // Create a view controller
       let viewController = ListViewController()
        // create navigation controller
        let navController = UINavigationController(rootViewController: viewController)
       // Assign the view controller as `window`'s root view controller
       window?.rootViewController = navController
       // Show the window
       window?.makeKeyAndVisible()
        return true
    }
}

