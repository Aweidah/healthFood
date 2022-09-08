//
//  Constants.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/10/22.
//

import Foundation
import UIKit

//class Service {
//    static func createAlertController(title: String, message: String) -> UIAlertController {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
//            alert.dismiss(animated: true, completion: nil)
//        }
//        alert.addAction(okAction)
//        return alert
//    }
//}
struct Constants {
    
    struct Storyboard {
        
        static let MainVC = "MainVC"
        static let LogInVC = "LogInVC"
        static let LogOnVC = "LogOnVC"
        static let ForgotPasswordVC = "ForgotPasswordVC"
        static let TabBarVC = "TabBarVC"
        static let OffersVC = "OffersVC"
        static let MenuVC = "MenuVC"
        static let SettingsVC = "SettingsVC"
        static let CartVC = "CartVC"
        static let SettingsAccVC = "SettingsAccVC"
        static let SettingsChangeNumVC = "SettingsChangeNumVC"
        
    }
    //"wrong__info_message".localized
    //error!.localizedDescription
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        return alert
    }
    
}

//if error != nil{
//    let alert = Constants.createAlertController(title: "Error", message: "Oops, something went worng, Please try again later.")
//            self.present(alert, animated: true, completion: nil)
//            return

//        let storyboard = UIStoryboard(name: "TabBarSB", bundle: nil)
//        let TabBarVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.TabBarVC) as? TabBarVC
//
//        self.view.window?.rootViewController = TabBarVC
//        self.view.window?.makeKeyAndVisible()
//        self.navigationController?.pushViewController(ForgotPasswordVC, animated: true)
