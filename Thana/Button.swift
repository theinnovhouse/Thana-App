//
//  Button.swift
//  Thana
//
//  Created by Gokul Nair on 20/04/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
 
class PurpleButton: UIButton{
    
    overrideinit(frame: CGRect){
        super.init(frame:frame)
    }
  
    init(title: String){
        super.init(frame: .zero)
        backgroundColor = .purple
    }
}
