//
//  MenuVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 7/21/22.
//

//import FirebaseDatabase
import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate ,  UISearchControllerDelegate {
    
//    ,UICollectionViewDelegate , UICollectionViewDataSource , UISearchResultsUpdating
    
//    self.UINavigationController.init(rootViewController: SingleFood_: ())
    
    var menuFoodArray = [menuFood]()
    
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
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        self.navigationItem.title = "Menu"
        navigationItem.searchController = searchBar
        
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_1.jpg")!, name: "Salat", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_2.jpg")!, name: "Freekeh", price: 6.0))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_3.jpg")!, name: "Lemon Creamy", price: 6.0))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_1.jpg")!, name: ".", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_2.jpg")!, name: ".", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_3.jpg")!, name: ".", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_2.jpg")!, name: ".", price: 3.3))
        menuFoodArray.append(menuFood.init(photo: UIImage(named: "IMG_1.jpg")!, name: "okay", price: 3.3))
     
    }
    
    struct menuFood {
        
        let photo: UIImage
        let name: String
        let price: Double
    }

}
