//
//  MainVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/3/22.
//

import UIKit
import Lottie

class MainVC: UIViewController {
    
    let animationView = AnimationView()
    //Animation MainScreen
    @IBOutlet weak var lottieView: UIView!
    
    // Firebase remote config 3 func
    @IBOutlet weak var rcLable: UILabel!
    
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
    }
    
    @IBAction func LogOnPressed(_ sender: Any) {
        
        let LogonNav = UIStoryboard(name: "LogonSB", bundle: nil).instantiateViewController(withIdentifier: "LogonNav") as! UINavigationController
        
        LogonNav.modalPresentationStyle = .fullScreen
        self.present(LogonNav, animated: true)
    }
    
    
    
    
    
//  setupRemoteConfigDefaults
    
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
    
    //Lottie
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAnimation()

    }
        
    private func setupAnimation() {
        animationView.animation = Animation.named("food-vlogger")
        animationView.frame = lottieView.bounds
        animationView.animationSpeed = 2.0
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        lottieView.addSubview(animationView)
    }
}
