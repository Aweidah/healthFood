//
//  SettingsAccVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/23/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SettingsAccVC: UIViewController {
    
    //FirstName
    @IBOutlet weak var firstnameField: UITextField!
    //LastName
    @IBOutlet weak var lastnameField: UITextField!
    //Email
    @IBOutlet weak var emailField: UITextField!
    //Phone Number
    @IBOutlet weak var NumberField: UITextField!
    
    @IBOutlet weak var edit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editPressed(_ sender: Any) {
        
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
        //        firstnameField.isEnabled = true
        //        lastnameField.isEnabled = true
        //        emailField.isEnabled = true
        //        NumberField.isEnabled = true
        
        //        tableView.isEditing = !tableView.isEditing
        //                if tableView.isEditing == true{
        ////                    editButtonItem.setTitle("Done", for: .normal)
        //                    editPressed("Done")
        //                    firstnameField.alpha = 1
        //                    lastnameField.alpha = 1
        //                    emailField.alpha = 1
        //                    NumberField.alpha = 1
        //                }
        //                else
        //                {
        //                    editPressed("Edit")
        ////                    editPressed.setTitle("Edit", for: .normal)
        //                    firstnameField.alpha = 0
        //                    lastnameField.alpha = 0
        //                    emailField.alpha = 0
        //                    NumberField.alpha = 0
        //                }
    }
    
    @IBAction func deleteAccPressed(_ sender: Any) {
        
        let user = Auth.auth().currentUser
        user?.delete { error in
            if let err = error {
                // An error happened.
                let alert = Constants.createAlertController(title: "Error", message: "Oops, something went worng, Please try again later.")
                self.present(alert, animated: true, completion: nil)
                return
            } else {
                // Account deleted.
                try!  Auth.auth().signOut()
                let alert = Constants.createAlertController(title: "Success", message: "Your account will delete after 1 second")
                self.present(alert, animated: true, completion: nil)
                return
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) { [weak self] in
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC")
                    mainVC.modalPresentationStyle = .fullScreen
                    self?.present(mainVC, animated: true)
                }
            }
        }
    }
    
    func savePressed(_ sender: Any) {
        
    }
    
}
