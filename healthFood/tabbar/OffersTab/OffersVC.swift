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
    let searchBar = UISearchController(searchResultsController: nil)
    
    //old line code only menuFoodArray
    var menuFoodArray = [menuFood]() //searchedperfume
    var FoodArray = [menuFood]() //perfumeList
    
    var scopeButtonPressed = false
    var searching = false
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching || scopeButtonPressed {
            return menuFoodArray.count
        }else {
            return FoodArray.count
        }
    }//done
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mycell", for: indexPath) as! TableViewCell
        
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
        
        //        let mydata = menuFoodArray[indexPath.row]
        //
        //        cell.fillCall(photo: mydata.photo, name: mydata.name, type: mydata.type, price: mydata.price)
        
        //        return cell
    }//done
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }//done
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let scopeButton = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
        
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            menuFoodArray.removeAll()
            
            for offer in FoodArray {
                if offer.name.lowercased().contains(searchText.lowercased()) && (offer.type == scopeButton || scopeButton == "All Rewards")
                {
                    menuFoodArray.append(offer)
                }}}
        else {
            if scopeButtonPressed {
                menuFoodArray.removeAll()
                let scopeButton = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
                for offer in FoodArray {
                    if (offer.name == scopeButton || scopeButton == "All Rewards") {
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
    }//done
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        menuFoodArray.removeAll()
        tableView.reloadData()
    }//done
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        //        searchController.searchBar.text = ""
        //        scopeButtonPressed = true
        //
        //        let scopeButton = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
        //
        //        menuFoodArray.removeAll()
        //
        //        for offers in FoodArray {
        //            if (offers.type == scopeButton || scopeButton == "All Rewards"){
        //                menuFoodArray.append(offers)
        //            }
        //        }
        //        tableView.reloadData()
    }
    //    var menuFoodArray = [menuFood]() //searchedperfume
    //    var FoodArray = [menuFood]() //perfumeList
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cartVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.CartVC) as? CartVC
        
        //        if searching || scopeButtonPressed {
        //            CartVC?.photo = UIImage(named: "\(menuFoodArray[indexPath.row].photo)")!
        //            CartVC?.name = (menuFoodArray[indexPath.row].name)
        //            CartVC?.price = ("\(menuFoodArray[indexPath.row].price) Jd")
        //            self.present((cartVC)!, animated: true, completion: nil)
        //        }
        //        else {
        //            CartVC?.photo = UIImage(named: FoodArray[indexPath.row].photo)!
        //            CartVC?.name = (FoodArray[indexPath.row].name)
        //            CartVC?.price = ("\(FoodArray[indexPath.row].price) JD")
        //            self.present((cartVC)!, animated: true, completion: nil)
        //        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //        menuFoodArray = []
        //
        //        var menuFoodArray = [menuFood]()
        //
        //        for word in [menuFood]()
        //        {
        //            if word.name.uppercased().contains(searchText.uppercased())
        //            {
        //                menuFoodArray.append(word)
        //            }
        //        }
        //
        //        self.tableView.reloadData()
    }
    
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
        
        
        let offer1 = (menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "First Deal", type: "Deals", price: 180))
        FoodArray.append(offer1)
        let offer2 = (menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "Second Deal", type: "Deals", price: 220))
        FoodArray.append(offer2)
        let offer3 = (menuFood.init(photo: UIImage(named: "menu.jpg")!, name: "Third Deal", type: "Deals", price: 285))
        FoodArray.append(offer3)
        let offer4 = (menuFood.init(photo: UIImage(named: "menu.jpg")!, name: " Deal", type: "All Rewards", price: 285))
        FoodArray.append(offer4)
        
        //old code line
        //        menuFoodArray.append(menuFood.init(photo: UIImage(named: "menu.jpg")!, name: " Deal", type: "", price: 285))
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
        searchBar.searchBar.scopeButtonTitles = ["All Rewards" , "Deals"]
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchBar
        definesPresentationContext = true
        //        searchBar.searchBar.placeholder = "Search Offers By Name"
    }
}

