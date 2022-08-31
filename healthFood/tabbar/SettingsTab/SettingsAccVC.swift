//
//  SettingsAccVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/23/22.
//

import UIKit

class SettingsAccVC: UIViewController {
    
    //FirstName
    @IBOutlet weak var firstnameField: UITextField!
    //LastName
    @IBOutlet weak var lastnameField: UITextField!
    //Email
    @IBOutlet weak var emailField: UITextField!
    //Phone Number
    @IBOutlet weak var NumberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editPressed(_ sender: Any) {
//        firstnameField.isEnabled = true
//        lastnameField.isEnabled = true
//        emailField.isEnabled = true
//        NumberField.isEnabled = true
        
        if isEditing != true {
            firstnameField.alpha = 1
            lastnameField.alpha = 1
            emailField.alpha = 1
            NumberField.alpha = 1
        }
        else {
            firstnameField.alpha = 0
            lastnameField.alpha = 0
            emailField.alpha = 0
            NumberField.alpha = 0
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
       }
    
    @IBAction func deleteAccPressed(_ sender: Any) {
        
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
    }
    
    
}
