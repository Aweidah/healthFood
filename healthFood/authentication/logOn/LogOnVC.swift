//
//  LogOnVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/3/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import SVProgressHUD

class LogOnVC: UIViewController {
    
    //First Name
    @IBOutlet weak var firstNameField: UITextField!
    //Last Name
    @IBOutlet weak var lastNameField: UITextField!
    //Email
    @IBOutlet weak var emailField: UITextField!
    //Phone Number
    @IBOutlet weak var phoneField: UITextField!
    //Password
    @IBOutlet weak var passwordField: UITextField!
    //Logon
    @IBOutlet weak var logOnBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    // Check the fields and validate that the data is correct.
    
    func validateFields() -> String? {
        
        // check that all fields are filled in
        if firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        // check if the password is secure
        let cleanPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanPassword) == false {
            
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }
    
    
    @IBAction func logOnPressed(_ sender: Any) {
        
        // Validate the field
        
        // Create cleaned versions of the data
        let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        showLoading()
        // Create the user
        Auth.auth().createUser(withEmail: email, password: password){ (result, err) in
        
            self.hideLoading()
            // Check for errors
            if err != nil{
                
                // There was an error creating the user
                //                self.showError("Error creating user")
            }
            else{
                
                // User was created successfully, now store the first name and last name
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: [
                    "firstname":firstName,
                    "lastname":lastName,
                    "number":phone,
                    "password":password,
                    "email":email,
                    "uid": result!.user.uid
                ])
                {
                    (error) in
                }
            }
            // Transition to the home screen
            self.transitionToHome()
        }
        
    }
    
    func transitionToHome() {
        
        let storyboard = UIStoryboard(name: "TabBarSB", bundle: nil)
        
        let TabBarVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.TabBarVC) as? TabBarVC
        
        self.view.window?.rootViewController = TabBarVC
        self.view.window?.makeKeyAndVisible()
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
