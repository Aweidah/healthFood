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
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var editSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        // Do any additional setup after loading the view.
    }
    
    //Get data from database
    private func setData(){
        
        let db = Firestore.firestore()
        
        db.collection("users").whereField("email", isEqualTo: Auth.auth().currentUser?.email ?? "")
            .getDocuments() {[weak self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        
                        self!.firstnameField.text = (document.get("firstname") as! String)
                        self!.lastnameField.text = (document.get("lastname") as! String)
                        self!.emailField.text = (document.get("email") as! String)
                        self!.phoneField.text = (document.get("number") as! String)
                    }
                }
            }
    }
    
    @IBAction func editSwitchPressed(_ sender: Any) {
        
        if editSwitch.isOn == true {
            
            setData()
            
            firstnameField.isEnabled = true
            lastnameField.isEnabled = true
            emailField.isEnabled = true
            phoneField.isEnabled = true
        }
        if editSwitch.isOn == false{
            
            setData()
            
            firstnameField.isEnabled = false
            lastnameField.isEnabled = false
            emailField.isEnabled = false
            phoneField.isEnabled = false
            
        }
    }
    
    @IBAction func deleteAccPressed(_ sender: Any) {
        
        let user = Auth.auth().currentUser
        user?.delete { error in
            //            if let err = error
            if error != nil {
                // An error happened.
                let alert = Constants.createAlertController(title: "Error", message: "Oops, something went worng, Please try again later.")
                self.present(alert, animated: true, completion: nil)
                return
            } else {
                // Account deleted.
                try!  Auth.auth().signOut()
                let alert = Constants.createAlertController(title: "Success", message: "Your account will delete after 1 second")
                self.present(alert, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) { [weak self] in
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC")
//                    mainVC.downloadJSON()
                    mainVC.modalPresentationStyle = .fullScreen
                    self?.present(mainVC, animated: true)
                    return
                }
            }
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        //        let db = Firestore.firestore()
        //        let userEmail = Auth.auth().currentUser?.email
        //
        //        db.collection("users")
        //            .whereField("email", isEqualTo: userEmail ?? "")
        //            .getDocuments() { (querySnapshot, err) in
        //                if let err = err {
        //                    print(err.localizedDescription)
        //                    // Some error occured
        //                } else if querySnapshot!.documents.count != 1 {
        //                    // Perhaps this is an error for you?
        //                } else {
        //                    let document = querySnapshot!.documents.first
        //                    document?.reference.updateData([
        //                        "email": self.emailField.text!,
        //                        "firstname": self.firstnameField.text!,
        //                        "lastname": self.lastnameField.text!,
        //                        "number": self.phoneField.text!
        //                    ])
        //                }
        //            }
        let db = Firestore.firestore()
        
        let userID = Auth.auth().currentUser?.uid
        let userEmail = Auth.auth().currentUser?.email
        let currentUser = Auth.auth().currentUser
        if  firstnameField.text != nil &&
                lastnameField.text != nil &&
                emailField.text != nil &&
                phoneField.text != nil
        {
            db.collection("users").document("\(userID!)").updateData([
                "firstname": firstnameField.text!,
                "lastname": lastnameField.text!,
                "email": emailField.text!,
                "number": phoneField.text!
            ])
            if emailField.text != userEmail{
                currentUser?.updateEmail(to: emailField.text!){ error in
                    if let error = error{
                        print(error)
                    }
                }
            }
        }
        
    }
}

