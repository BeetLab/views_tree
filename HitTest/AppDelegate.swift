//
//  AppDelegate.swift
//  HitTest
//
//  Created by Krasa on 11/04/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let assembly = HittestableControllerAssembly()
        window = UIWindow()
        window?.rootViewController = assembly.buildController()
        window?.makeKeyAndVisible()
        return true
    }
}

