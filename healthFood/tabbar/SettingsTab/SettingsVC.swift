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
import MOLH

class SettingsVC: UIViewController {
    
    @IBOutlet weak var ImgPro: UIImageView!
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
        
        if (isArabic()) {
            self.lblSelectedLanguage.text = "العربية"
        } else {
            self.lblSelectedLanguage.text = "English"
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").whereField("email", isEqualTo: Auth.auth().currentUser?.email ?? "")
            .getDocuments() {[weak self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        //               print("\(document.get("firstname"))")
                        self!.lblFullname.text = "\(document.get("firstname") as! String) \(document.get("lastname") as! String)"
                        self!.lblLocation.text = (document.get("uid") as! String)
                        //self!.ImgPro = (document.get("img") as? UIImageView)
                    }
                }
            }
    }
    
    func isArabic() -> Bool {
        if (MOLHLanguage.currentAppleLanguage() == "ar"){
            return true
        }else{
            return false
        }
    }
    
    @IBAction func notificationsAction(_ sender: Any) {
        
    }
    
    @IBAction func CartPressed(_ sender: Any) {
        
        let cartVC = UIStoryboard(name: "SettingsSB", bundle: nil).instantiateViewController(withIdentifier: "CartVC")
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    @IBAction func accountPressed(_ sender: Any) {
        
        let settingsAccVC = UIStoryboard(name: "SettingsSB", bundle: nil).instantiateViewController(withIdentifier: "SettingsAccVC")
        self.navigationController?.pushViewController(settingsAccVC, animated: true)
    }
    
    @IBAction func ChangePasswordPressed(_ sender: Any) {
        
        let settingsChangeNumVC = UIStoryboard(name: "SettingsSB", bundle: nil).instantiateViewController(withIdentifier: "SettingsChangeNumVC")
        self.navigationController?.pushViewController(settingsChangeNumVC, animated: true)
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
                    if (MOLHLanguage.currentAppleLanguage() == "en") {
                        MOLH.setLanguageTo("ar")
                        MOLHLanguage.setAppleLAnguageTo("ar")
                        MOLH.reset()
                    }
                    break
                case 2:
                    //english
                    if (MOLHLanguage.currentAppleLanguage() == "ar") {
                        MOLH.setLanguageTo("en")
                        MOLHLanguage.setAppleLAnguageTo("en")
                        MOLH.reset()
                    }
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
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC")
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
    }
}
