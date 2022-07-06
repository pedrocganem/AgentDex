//
//  AppDelegate.swift
//  AgentDex
//
//  Created by Pedro Ganem on 03/07/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let controller = HomeViewController()
        window.rootViewController = controller
        self.window = window
        window.makeKeyAndVisible()
        return true
    }



}

