//
//  LogInVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 7/28/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import SVProgressHUD

class LogInVC: UIViewController {
    
    //Image
    
    //Email
    @IBOutlet weak var fieldEmail: UITextField!
    
    //Password
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var PasswordBtn: UIButton!
    private var isPasswordVisible : Bool = false
    
    //forgot password Btn
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    //logIn Btn
    @IBOutlet weak var LogInBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        setUpTestingData()
        #endif
    }
    
    private func setUpTestingData() {
        self.fieldEmail.text = "khaled.aweidah@yahoo.com"
        self.fieldPassword.text = "P@ssw0rd1"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func passwordSecurePressed(_ sender: Any) {
        if (isPasswordVisible) {
            isPasswordVisible = false
            fieldPassword.isSecureTextEntry = true
            self.PasswordBtn.setImage(UIImage(named: "ic_showpassword"), for: .normal)
            
        }else {
            isPasswordVisible = true
            fieldPassword.isSecureTextEntry = false
            self.PasswordBtn.setImage(UIImage(named: "ic_hidepassword"), for: .normal)
        }
    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ForgotPasswordSB", bundle: nil)
        
        let ForgotPasswordVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.ForgotPasswordVC) as! ForgotPasswordVC
        
        self.navigationController?.pushViewController(ForgotPasswordVC, animated: true)
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        loginUser()
    }
    
    private func loginUser() {
        
        let email = fieldEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = fieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        showLoading()
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            self.hideLoading()
            
            if error != nil{
                let alert = Constants.createAlertController(title: "Error", message: "wrong_login_info_message".localized)
                self.present(alert, animated: true, completion: nil)
                return
            }
            else {
                
                let storyboard = UIStoryboard(name: "TabBarSB", bundle: nil)
                
                let TabBarVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.TabBarVC) as? TabBarVC
                
                self.view.window?.rootViewController = TabBarVC
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    func showLoading() {
        SVProgressHUD.setBackgroundColor(#colorLiteral(red: 0.3635145724, green: 0.2341234982, blue: 0.4046436846, alpha: 1))
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
}
