//
//  TabBarVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/3/22.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tabBar.tintColor = #colorLiteral(red: 0.3635145724, green: 0.2341234982, blue: 0.4046436846, alpha: 1)

//        let OffersVC = UINavigationController(rootViewController: UIStoryboard(name: "TabbarItems", bundle: nil).instantiateViewController(withIdentifier: "OffersVC") )
//        
//        let MenuVC = UINavigationController(rootViewController: UIStoryboard(name: "TabbarItems", bundle: nil).instantiateViewController(withIdentifier: "MenuVC") )
//        
//        let SettingsVC = UINavigationController(rootViewController: UIStoryboard(name: "TabbarItems", bundle: nil).instantiateViewController(withIdentifier: "SettingsVC") )

        let OffersVC: UIViewController = UIStoryboard(name: "OffersSB", bundle: nil).instantiateViewController(withIdentifier: "OffersVC")
        let MenuVC: UIViewController = UIStoryboard(name: "MenuSB", bundle: nil).instantiateViewController(withIdentifier: "MenuVC")
        let SettingsVC: UIViewController = UIStoryboard(name: "SettingsSB", bundle: nil).instantiateViewController(withIdentifier: "SettingsVC")
        
        
        
        let OffersItem = UITabBarItem(title: "Offers", image: UIImage(systemName: "seal"), selectedImage: UIImage(systemName: "seal.fill"))
        let MenuItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        let settingsItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.badge"))
        
        OffersVC.tabBarItem = OffersItem
        MenuVC.tabBarItem = MenuItem
        SettingsVC.tabBarItem = settingsItem

        setViewControllers([OffersVC, MenuVC, SettingsVC], animated: false)
    }
    
}

//import UIKit
//
//class TabBarVC: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Create instance of view controllors
//        let baggage = baggageFood()
//        let Single = SingleFood()
//        let settings = settings()
//
//        // Set title
//        baggage.title = "Offer"
//        Single.title = "Menu"
//        settings.title = "Settings"
//
//        // Assign view controllors to tab bar
//        self.setViewControllers([baggage, Single, settings], animated: false)
//
//        guard let items = self.tabBar.items else {
//            return
//        }
//
//        let image = ["Offer", "Menu", "Settings"]
//
//        for x in 0...2 {
//            items[x].image = UIImage(systemName: image[x])
//        }
//
//        // Change tint color
//        self.tabBar.tintColor = .green
//
//    }
//
//}

