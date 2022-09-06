//
//  AppDelegate.swift
//  healthFood
//
//  Created by khaled Aweidah on 7/21/22.
//

import UIKit
import Firebase
import FirebaseCore
import IQKeyboardManagerSwift
import MOLH

var remoteConfig = RemoteConfig.remoteConfig()

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        //keyboard global settings
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 50
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        //MOLH Language
        MOLH.shared.activate(true)
        
        return true
    }

    func reset() {
        let storyboard = UIStoryboard(name: "TabBarSB", bundle: nil)
        
        let TabBarVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.TabBarVC) as? TabBarVC
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = TabBarVC
        self.window?.makeKeyAndVisible()
    }

}
