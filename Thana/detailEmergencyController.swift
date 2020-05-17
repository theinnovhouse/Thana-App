//
//  detailEmergencyController.swift
//  Thana
//
//  Created by Gokul Nair on 22/03/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class detailEmergencyController: UIViewController {

    var getname:String = ""
    var getImage = UIImage()
    var getdesignation:String = ""
    var getemail:String = ""
    var getPhoneNum:String = ""
    
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var emailname: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgImage.image = getImage
        lblName.text = getname
        designation.text = getdesignation
        emailname.text = getemail
        phoneNumber.text = getPhoneNum
    
    }
    

    }
    


