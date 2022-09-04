//
//  OffersVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 7/21/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import FirebaseAnalytics

class OffersVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    
    
    let db = Firestore.firestore()
    
    var scopeButtonPressed = false
    var searching = false
    
    //old line code only menuFoodArray
    var menuFoodArray = [menuFood]() //searchedperfume
    var FoodArray = [menuFood]() //perfumeList
    //    var filterdData: [String]!
    let searchBar = UISearchController(searchResultsController: nil)
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching || scopeButtonPressed {
            return menuFoodArray.count
        }else {
            return FoodArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mycell", for: indexPath) as! TableViewCell
        
//        let mydata = menuFoodArray[indexPath.row]
//
//        cell.fillCall(photo: mydata.photo, name: mydata.name, type: mydata.type, price: mydata.price)

//        return cell
        
        
        if searching || scopeButtonPressed {
            //cell.imgFood.image = UIImage(named: menuFoodArray[indexPath.row].photo)
            cell.imgFood.image = UIImage(named: "\(menuFoodArray[indexPath.row].photo)")
            cell.LblName.text = menuFoodArray[indexPath.row].name
            cell.LblPrice.text = ("\(menuFoodArray[indexPath.row].price) JD")
            
        }else {
            
            cell.imgFood.image = UIImage(named: "\(FoodArray[indexPath.row].photo)")
            cell.LblName.text = FoodArray[indexPath.row].name
            cell.LblPrice.text = ("\(FoodArray[indexPath.row].price) JD")
        }
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
    
    func updateSearchResults(for searchController: UISearchController) {
        let scopeButton = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
        
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            menuFoodArray.removeAll()
            
            for offer in FoodArray {
                if offer.name.lowercased().contains(searchText.lowercased()) && (offer.type == scopeButton || scopeButton == "All")
                {
                    menuFoodArray.append(offer)
                }}}
        else {
            if scopeButtonPressed {
                menuFoodArray.removeAll()
                let scopeButton = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
                for offer in FoodArray {
                    if (offer.name == scopeButton || scopeButton == "All") {
                        menuFoodArray.append(offer)
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
    
    //    func writedata(text: String){
    //
    //        let docRef = database.document("")
    //        docRef.setData(["text": text])
    //    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        self.navigationItem.title = "Offers"
        navigationItem.searchController = searchBar
        
        //        let docRef = database.document("")
        //        docRef.getDocument { snapshot, error in
        //            guard let data = snapshot?.data(), error == nil else {
        //                return
        //        }
        //            print(data)
        //        }
        //        filterdData = menuFoodArray
        
        
        let offer1 = (menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "First Deal", type: "", price: 180))
        FoodArray.append(offer1)
        let offer2 = (menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "Second Deal", type: "", price: 220))
        FoodArray.append(offer2)
        let offer3 = (menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "Third Deal", type: "", price: 285))
        FoodArray.append(offer3)
        let offer4 = (menuFood.init(photo: UIImage(named: "menu.jpg")!, name: " Deal", type: "", price: 285))
        FoodArray.append(offer4)
        
        //old code line
        //        menuFoodArray.append(menuFood.init(photo: UIImage(named: "menu.jpg")!, name: " Deal", price: 285))
    }
    
    struct menuFood {
        
        let photo: UIImage
        let name: String
        let type: String
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
    private func configureSearchController() {
        searchBar.loadViewIfNeeded()
        searchBar.searchResultsUpdater = self
        searchBar.searchBar.delegate = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.enablesReturnKeyAutomatically = false
        searchBar.searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.searchBar.scopeButtonTitles = ["All" , "Men" , "Women"]
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchBar
        definesPresentationContext = true
        //        searchBar.searchBar.placeholder = "Search Offers By Name"
    }
}

