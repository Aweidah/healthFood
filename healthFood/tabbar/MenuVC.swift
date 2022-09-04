//
//  MenuVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 7/21/22.
//

//import FirebaseDatabase
import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import FirebaseAnalytics

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate ,  UISearchControllerDelegate, UISearchResultsUpdating {
    
    
    let db = Firestore.firestore()
    
    var scopeButtonPressed = false
    var searching = false
    
    //old line code only menuFoodArray
    var menuFoodArray = [menuFood]() //searchedperfume
    var FoodArray = [menuFood]() //perfumeList
    //    var filterdData: [String]!
    let searchBar = UISearchController(searchResultsController: nil)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuFoodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mycell") as! TableViewCell
        
        let mydata = menuFoodArray[indexPath.row]
        cell.fillCall(photo: mydata.photo, name: mydata.name, type: mydata.type, price: mydata.price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        for word in [menuFood]()
        {
            if word.name.uppercased().contains(searchText.uppercased())
            {
                menuFoodArray.append(word)
            }
        }
        self.tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let scopeButton = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
        
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            menuFoodArray.removeAll()
            
            for menu in FoodArray {
                if menu.name.lowercased().contains(searchText.lowercased()) && (menu.type == scopeButton || scopeButton == "All")
                {
                    menuFoodArray.append(menu)
                }}}
        else {
            if scopeButtonPressed {
                menuFoodArray.removeAll()
                let scopeButton = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
                for menu in FoodArray {
                    if (menu.name == scopeButton || scopeButton == "All") {
                        menuFoodArray.append(menu)
                    }
                }
                searching = false
                tableView.reloadData()
            }
            else {
                searching = false
                menuFoodArray.removeAll()
                menuFoodArray = FoodArray
            }
            
        }
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        self.navigationItem.title = "Menu"
        navigationItem.searchController = searchBar
        
        let menu1 = (menuFood.init(photo: UIImage(named: "IMG_1.jpg")!, name: "Salad", type: "Salad", price: 3.3))
        FoodArray.append(menu1)
        let menu2 = (menuFood.init(photo: UIImage(named: "IMG_2.jpg")!, name: "Freekeh", type: "Dinner", price: 6.0))
        FoodArray.append(menu2)
        let menu3 = (menuFood.init(photo: UIImage(named: "IMG_3.jpg")!, name: "Lemon Creamy", type: "Dinner", price: 6.0))
        FoodArray.append(menu3)
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_1.jpg")!, name: ".", type: "", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_2.jpg")!, name: ".", type: "", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_3.jpg")!, name: ".", type: "", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_2.jpg")!, name: ".", type: "", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_1.jpg")!, name: "okay", type: "", price: 3.3))
        
    }
    
    struct menuFood {
        
        let photo: UIImage
        let name: String
        let type: String
        let price: Double
    }
    
    private func configureSearchController() {
        searchBar.loadViewIfNeeded()
        searchBar.searchResultsUpdater = self
        searchBar.searchBar.delegate = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.enablesReturnKeyAutomatically = false
        searchBar.searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.searchBar.scopeButtonTitles = ["All" ,"Snack" , "Salad" , "Breakfast", "Dinner"]
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchBar
        definesPresentationContext = true
        //        searchBar.searchBar.placeholder = "Search Menu By Name"
    }
}
