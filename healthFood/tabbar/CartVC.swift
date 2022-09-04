//
//  CartVC.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/24/22.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var myArray = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mycell", for: indexPath)
        
        cell.textLabel?.text = myArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        myArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { myAction, view, completionHandler in
            
            self.myArray.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completionHandler(true)
        }
        /*
         let add = UIContextualAction(style: .destructive, title: "String?") { myAction, view, completionHandler in
         
         self.myArray.remove(at: indexPath.row)
         tableView.beginUpdates()
         tableView.deleteRows(at: [indexPath], with: .bottom)
         tableView.endUpdates()
         completionHandler(true)
         
         }
         */
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let add = UIContextualAction(style: .destructive, title: "String?") { myAction, view, completionHandler in
            
            self.myArray.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .bottom)
            tableView.endUpdates()
            completionHandler(true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [add])
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var AddTextField: UITextField!
    @IBOutlet weak var ImgFood: UIImageView!
    var photo = UIImage()
    @IBOutlet weak var LblName: UILabel!
    var name = ""
    @IBOutlet weak var LblPrice: UILabel!
    var price = ""
    @IBOutlet weak var LblType: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        ImgFood.image = photo
        //        LblName.text = name
        //        LblPrice.text = "\(price)"
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func EditTable(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    @IBAction func AddItem(_ sender: Any) {
        
        if let myText = AddTextField.text{
            myArray.append(myText)
            
            let IndexPath = IndexPath(row: myArray.count-1, section: 0)
            
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    @IBAction func Cart(_ sender: Any) {
    }
}
