//
//  cellContrller.swift
//  Thana
//
//  Created by Gokul Nair on 24/03/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class cellContrller: UITableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
