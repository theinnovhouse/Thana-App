//
//  cellTableViewCell.swift
//  
//
//  Created by Gokul Nair on 22/03/20.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lablName: UILabel!
    
        
   

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
