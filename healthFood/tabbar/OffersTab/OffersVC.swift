//
//  OffersVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 7/21/22.
//

import FirebaseFirestore
import UIKit

class OffersVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate {
    
//    self.tableView.reloadData()
//    let database = Firestore.firestore()
    
    var menuFoodArray = [menuFood]()
//    var filterdData: [String]!
    let searchBar = UISearchController()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuFoodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mycell") as! TableViewCell
        
        let mydata = menuFoodArray[indexPath.row]
        
        cell.fillCall(photo: mydata.photo, name: mydata.name, price: mydata.price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        menuFoodArray = []
        
        var menuFoodArray = [menuFood]()
        
        for word in [menuFood]()
        {
            if word.name.uppercased().contains(searchText.uppercased())
            {
                menuFoodArray.append(word)
            }
        }
        
        self.tableView.reloadData()
    }
    
//    func writedata(text: String){
//
//        let docRef = database.document("")
//        docRef.setData(["text": text])
//    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
//        let docRef = database.document("")
//        docRef.getDocument { snapshot, error in
//            guard let data = snapshot?.data(), error == nil else {
//                return
//        }
//            print(data)
//        }
//        filterdData = menuFoodArray
        
        self.navigationItem.title = "Offers"
        navigationItem.searchController = searchBar
        
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "First Deal", price: 180))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "Second Deal", price: 220))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "Third Deal", price: 285))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "menu.jpg")!, name: " Deal", price: 285))
    }
    
    struct menuFood {
        
        let photo: UIImage
        let name: String
        let price: Double
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filterdData = []
//
//        if searchText == "" {
//            filterdData = menuFoodArray
//        }
//        else
//        {
//            for food in menuFoodArray{
//                if food.name.lowercased().contains(searchText.lowercased()){
//                    filterdData.append(food)
//                }
//            }
//        }
//        self.tableView.reloadData()
//    }

//    extension baggageFood : UITextFieldDelegate {
//        func textFieldDidBeginEditing (searchController : searchController)
//        if(searchController() == self.searchController){
//            self.searchController.layer.borderColor = uicolor.orange.cgColor
//        }
//    }
//
//    func textFieldDidEndEditing (searchController : searchController) {
//        if(searchController() == self.searchController){
//            self.searchController.layer.borderColor = UIColor(named: "subtitleColor")?.cgColor
//        }
//    }
    
}

