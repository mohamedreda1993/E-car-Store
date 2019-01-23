//
//  CarCell.swift
//  E-car commerce
//
//  Created by mohamed on 1/19/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nametf: UILabel!
    @IBOutlet weak var pricetf: UILabel!
    
    @IBOutlet weak var ratetf: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
