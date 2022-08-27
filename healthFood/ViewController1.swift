//
//  ViewController1.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/11/22.
//

import UIKit

class ViewController1: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create instance of view controllors
        let settings = setting()
        
        // Set title
        settings.title = "Settings"
        
        // Assign view controllors to tab bar
        self.setViewControllers([settings], animated: false)
        
        guard let items = self.tabBar.items else {
            return
        }
        
//        let image = ["Settings"]
//        
//        for x in 0...1 {
//            items[x].image = UIImage(systemName: image[x])
//        }
        
        // Change tint color
        self.tabBar.tintColor = .green
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//class baggageFood: UIViewController{
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .red
//    }
//}
//
//class SingleFood: UIViewController{
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .orange
//    }
//}

class setting: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
