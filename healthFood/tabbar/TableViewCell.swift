//
//  TableViewCell.swift
//  healthFood
//
//  Created by khaled Aweidah on 7/21/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var LblName: UILabel!
    @IBOutlet weak var LblPrice: UILabel!
    @IBOutlet weak var AddCard: UIButton!
    @IBOutlet weak var imgFood: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillCall (photo : UIImage, name : String ,price : Double)
    {
        imgFood.image = photo
        LblName.text = name
        LblPrice.text = "\(price)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
