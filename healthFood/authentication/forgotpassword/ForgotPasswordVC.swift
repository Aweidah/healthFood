//
//  ForgotPasswordVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/3/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import BRYXBanner

class ForgotPasswordVC: UIViewController {
    
    //Email
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendEmailPressed(_ sender: Any) {
        
        let email = emailField.text ?? ""
        
        FirebaseAuth.Auth.auth().sendPasswordReset(withEmail: email, completion: { error in
            
            guard error == nil else {
                let errorMessage = error?.localizedDescription
                self.showBanner(title: "Healthy Food", message: errorMessage ?? "error", style: UIColor.red)
                return
            }
            self.showBanner(title: "Healthy Food", message: "An email was sent to reset your password.", style: UIColor.purple)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        })
        self.emailField.resignFirstResponder()
    }
    func showBanner(title:String, message:String,style: UIColor) {
        let banner = Banner(title: title, subtitle: message, image: nil, backgroundColor: style)
        banner.dismissesOnTap = true
        banner.textColor = UIColor.white
        banner.show(duration: 3.0)
    }
}

