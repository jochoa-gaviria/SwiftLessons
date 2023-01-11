//
//  AppDelegate.swift
//  iOS-Calculator
//
//  Created by Juan on 10/1/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Setup
        setupView()
        return true
    }

    // MARK: - Private methods
    
    private func setupView(){
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = HomeViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
