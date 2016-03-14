//
//  TableViewCell.swift
//  rc
//
//  Created by Arseniy Krupenin on 13.03.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var visitorPhone: UILabel!
    @IBOutlet weak var clientPhone: UILabel!
    @IBOutlet weak var arrow: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var likedImage: UIImageView!
    @IBOutlet weak var freeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
