//
//  MainVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/3/22.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Firebase remote config
        setupRemoteConfigDefaults()
        displayNewValues()
        fetchRemoteConfig()
    }
    @IBAction func LogInPressed(_ sender: Any) {
        
        let loginNav = UIStoryboard(name: "LoginSB", bundle: nil).instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
        
        loginNav.modalPresentationStyle = .fullScreen
        self.present(loginNav, animated: true)
        
//        let storyboard = UIStoryboard(name: "LoginSB", bundle: nil)
//
//        let LogInVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.LogInVC) as! LogInVC
        
//        let navController = UINavigationController(rootViewController: LogInVC)
//        navController.modalPresentationStyle = .fullScreen
//        self.present(navController, animated:true, completion: nil)
        
//        LogInVC.modalPresentationStyle = .fullScreen
//        self.present(LogInVC , animated: true)
        
//        self.navigationController?.pushViewController(ForgotPasswordVC, animated: true)
//        self.view.window?.rootViewController = LogInVC
//        self.view.window?.makeKeyAndVisible()

    }
    
    @IBAction func LogOnPressed(_ sender: Any) {
        
        let LogonNav = UIStoryboard(name: "LogonSB", bundle: nil).instantiateViewController(withIdentifier: "LogonNav") as! UINavigationController
        
        LogonNav.modalPresentationStyle = .fullScreen
        self.present(LogonNav, animated: true)
    }
    
    // Firebase remote config 3 func
    @IBOutlet weak var rcLable: UILabel!

    func setupRemoteConfigDefaults() {
    let defaultValue = ["label_text": "Hello world!" as NSObject]
    remoteConfig.setDefaults(defaultValue)
    }
    
    func fetchRemoteConfig(){
    remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
    guard error == nil else { return }
    print("Got the value from Remote Config!")
    remoteConfig.activate()
    self.displayNewValues()
    }}
    
    func displayNewValues(){
    let newLabelText = remoteConfig.configValue(forKey: "label_text").stringValue ?? ""
        rcLable.text = newLabelText
    }
}
