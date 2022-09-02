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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editPressed(_ sender: Any) {
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
    
    @IBAction func deleteAccPressed(_ sender: Any) {

        let user = Auth.auth().currentUser

        user?.delete { error in
          if let error = error {
            // An error happened.
          } else {
            // Account deleted.
              try!  Auth.auth().signOut()
//              let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//              let MainVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.MainVC) as! MainVC
//
//      //      self.navigationController?.pushViewController(CartVC, animated: true)
//              self.view.window?.rootViewController = MainVC
//              self.view.window?.makeKeyAndVisible()
//              self.navigationController?.popToRootViewController(animated: true)
          }
        }
        
//    let credential: AuthCredential
//
//        users.reauthenticate(with:credential) { error in
//            if let error = error {
//                // An error happened.
//                showAlertWithErrorMessage(message: error.localizedDescription)
//            } else {
//                // User re-authenticated.
//                users.delete { error in
//                    if let error = error {
//                        // An error happened.
//                        showAlertWithErrorMessage(message: error.localizedDescription)
//                    } else {
//                        // Account deleted.
//                        Database.database().reference(fromURL: kFirebaseLink).child(kUser).child(userID).removeValue()
//
//                        try!  Auth.auth().signOut()
//                        self.navigationController?.popToRootViewController(animated: true)
//                    }
//                }
//
//                }
//            }
//        else{
//            showAlertWithErrorMessage(message: "Try again later")
//        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
    }
    
    
}
