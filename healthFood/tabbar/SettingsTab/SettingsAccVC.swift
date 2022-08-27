//
//  SettingsAccVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/23/22.
//

import UIKit

class SettingsAccVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
}
