//
//  ForgotPasswordVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/3/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ForgotPasswordVC: UIViewController {

    //Email
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendEmailPressed(_ sender: Any) {
    
//        let email = emailField.text ?? ""
//
//        FirebaseAuth.Auth.auth().sendPasswordReset(withEmail: email, completion: { error in
//
//            guard error == nil else {
//                let errorMessage = error?.localizedDescription
//                //self.showBanner(title: "Healthy Food", message: errorMessage ?? "error", style: UIColor.red)
//                return
//            }
//            //self.showBanner(title: "Bus Locator", message: "An email was sent to reset your password.", style: UIColor.orange)
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { [weak self] in
//                self?.navigationController?.popViewController(animated: true)
//            }
//        })
//        self.emailField.resignFirstResponder()
        ////////////
//        Auth.auth().sendPasswordReset(withEmail: emailField.text!) { error in
//            DispatchQueue.main.async {
//                if self.emailField.text?.isEmpty == true || error != nil {
//                    let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
//                    resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    self.present(resetFailedAlert, animated: true, completion: nil)
//                }
//                if error == nil && self.emailField.text?.isEmpty==false{
//                    let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
//                    resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    self.present(resetEmailAlertSent, animated: true, completion: nil)
//                }
//            }
//        }
    }
}

