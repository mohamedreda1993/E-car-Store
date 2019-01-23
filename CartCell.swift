//
//  CartCell.swift
//  E-car commerce
//
//  Created by mohamed on 1/21/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var backview: UIView!{
        didSet{
            backview.layer.cornerRadius = backview.frame.height / 5
            backview.layer.borderWidth = 1
            backview.layer.borderColor = UIColor.lightGray.cgColor
            
            backview.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
            backview.layer.shadowRadius = 4
            backview.layer.shadowOffset = CGSize(width: 6, height: 6)
            backview.layer.shadowOpacity = 0.7
            backview.clipsToBounds = true
        }
    }
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var namelb: UILabel!
    @IBOutlet weak var pricelb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
