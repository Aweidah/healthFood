//
//  SettingsVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/12/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Sheeeeeeeeet

class SettingsVC: UIViewController {
    
    //User name
    @IBOutlet weak var lblFullname: UILabel!
    //User location
    @IBOutlet weak var lblLocation: UILabel!
    //Status natification
    @IBOutlet weak var switchNotifications: UISwitch!
    //Name the language now
    @IBOutlet weak var lblSelectedLanguage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if (isArabic()) {
//            self.lblSelectedLanguage.text = "العربية"
//        } else {
//            self.lblSelectedLanguage.text = "English"
//        }

        let db = Firestore.firestore()
        
        db.collection("users").whereField("email", isEqualTo: Auth.auth().currentUser?.email ?? "")
            .getDocuments() {[weak self] (querySnapshot, err) in
       if let err = err {
           print("Error getting documents: \(err)")
       } else {
           for document in querySnapshot!.documents {
               print("\(document.documentID) => \(document.data())")
//               print("\(document.get("firstname"))")
               self!.lblFullname.text = "\(document.get("firstname") as? String ?? "")  \(document.get("lastname") as? String ?? "")"
//               self?.lblFullname.
           }
        }
       }
    }
    
//    ref.collection("perfumes").getDocuments() {[weak self] (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        let nam = document.data()["name"] as? String
//                        let img = document.data()["image"] as? String
//                        let prc = document.data()["price"] as? Double
//                        let gender = document.data()["Gender"] as? String
//                        let doc = PerfumeData(pName: nam ?? "", pImg: img ?? "" , pPrice: prc ?? 0 , pGender: gender ?? "")
//                        self?.perfumeList.append(doc)
    
    @IBAction func notificationsAction(_ sender: Any) {
    }
    
    @IBAction func CartPressed(_ sender: Any) {
        
//        let SettingsNav = UIStoryboard(name: "SettingsSB", bundle: nil).instantiateViewController(withIdentifier: "SettingsNav") as! UINavigationController
//
//        SettingsNav.modalPresentationStyle = .fullScreen
//        self.present(SettingsNav, animated: true)
        
        let storyboard = UIStoryboard(name: "SettingsSB", bundle: nil)

        let CartVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.CartVC) as! CartVC

//      self.navigationController?.pushViewController(CartVC, animated: true)
        self.view.window?.rootViewController = CartVC
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func accountPressed(_ sender: Any) {
        
//        let SettingsNav = UIStoryboard(name: "SettingsSB", bundle: nil).instantiateViewController(withIdentifier: "SettingsNav") as! UINavigationController
//
//        SettingsNav.modalPresentationStyle = .fullScreen
//        self.present(SettingsNav, animated: true)
        
        let storyboard = UIStoryboard(name: "SettingsSB", bundle: nil)
        
        let SettingsAccVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.SettingsAccVC) as! SettingsAccVC

//        self.navigationController?.pushViewController(SettingsAccVC, animated: true)
        self.view.window?.rootViewController = SettingsAccVC
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func ChangePasswordPressed(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "SettingsSB", bundle: nil)
//
//        let SettingsChangeNumVC = storyboard.instantiateViewController(identifier: Constants.Storyboard.SettingsChangeNumVC) as! SettingsChangeNumVC
//
//        self.navigationController?.pushViewController(SettingsChangeNumVC, animated: true)
//        self.view.window?.rootViewController = SettingsChangeNumVC
//        self.view.window?.makeKeyAndVisible()
        
        let SettingsChgNav = UIStoryboard(name: "SettingsSB", bundle: nil).instantiateViewController(withIdentifier: "SettingsChgNav") as! UINavigationController
        
        SettingsChgNav.modalPresentationStyle = .fullScreen
        self.present(SettingsChgNav, animated: true)
        
    }
    
    @IBAction func contactUsPressed(_ sender: Any) {
        callNumber(number: "0791424061")
    }
    
    private func callNumber(number : String) {
        if let url = URL(string: "tel://\(number)"),
           UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func changeLanguagePressed(_ sender: Any) {
        showLanguageSheet()
    }
    
    func showLanguageSheet() {
        let item1 = MenuItem(title: "العربية", value: 1, image: UIImage(named: "a.square"))
        //a.square.fill
        let item2 = MenuItem(title: "English", value: 2, image: UIImage(named: "e.square"))
        //e.square.fill
        let menu = Menu(title: "Select Language", items: [item1, item2])
        
        let sheet = menu.toActionSheet { (ActionSheet, item) in
            if let value = item.value as? Int {
                switch (value) {
                case 1:
                    //arabic
//                    if (MOLHLanguage.currentAppleLanguage() == "en") {
//                        MOLH.setLanguageTo("ar")
//                        MOLHLanguage.setAppleLAnguageTo("ar")
//                        MOLH.reset()
//
//                    }
                    break
                case 2:
                    //english
//                    if (MOLHLanguage.currentAppleLanguage() == "ar") {
//                        MOLH.setLanguageTo("en")
//                        MOLHLanguage.setAppleLAnguageTo("en")
//                        MOLH.reset()
//                    }
                    break
                default:
                    print("1")
                    break
                }
            }
        }
        sheet.present(in: self, from: self.lblSelectedLanguage)
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        try! FirebaseAuth.Auth.auth().signOut()
        
//        present(.init(nibName: "MenuVC", bundle: nil), animated: true)
    }
    
}
