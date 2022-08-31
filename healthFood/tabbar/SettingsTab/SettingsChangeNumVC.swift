//
//  SettingsChangeNumVC.swift
//  healthFoodHTU
//
//  Created by khaled Aweidah on 8/26/22.
//

import UIKit

class SettingsChangeNumVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
