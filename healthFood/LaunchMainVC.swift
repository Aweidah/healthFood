//
//  LaunchMainVC.swift
//  healthFoodHTU
//
//  Created by khaled Aweidah on 8/30/22.
//

import UIKit
import Lottie

class LaunchMainVC: UIViewController {
    
    let animationView = AnimationView()
    //Animation LaunchScreen
    @IBOutlet weak var lottieViewLchSn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            
            let LaunchMainVC = MainVC()
            LaunchMainVC.modalTransitionStyle = .crossDissolve
            LaunchMainVC.modalPresentationStyle = .fullScreen
            self?.present(LaunchMainVC, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAnimation()
        
    }
    
    private func setupAnimation() {
        animationView.animation = Animation.named("coconut")
        animationView.frame = lottieViewLchSn.bounds
        animationView.animationSpeed = 2.3
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        lottieViewLchSn.addSubview(animationView)
    }
    
}
