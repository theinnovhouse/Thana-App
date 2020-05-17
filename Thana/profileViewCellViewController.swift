//
//  profileViewCellViewController.swift
//  Thana
//
//  Created by Gokul Nair on 05/05/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase

class profileViewCellViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelOfficerID: UILabel!
    @IBOutlet weak var labelDesi: UILabel!
    @IBOutlet weak var labelPlace: UILabel!
    
   let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()

        loadinfo()
        
        //retrieve data from firebase
        
            
            
     
    }
    func loadinfo(){
        db.collection(thana.FStore.collectionname).getDocuments{(querySnapshot, error) in
        if let e = error
        {
            print("the data is not displayed due to \(e)")
        }
        else {
            
            
            if let snapshotdDocuments = querySnapshot?.documents{
                for doc in snapshotdDocuments{
                    let data = doc.data()
                    if let user = data[thana.FStore.officerID] as? String,let name = data[thana.FStore.userName] as? String,let place = data[thana.FStore.userPlace] as? String ,let ID = data[thana.FStore.officerID] as? String ,let designation = data[thana.FStore.userDesignation] as? String {
                        
                        self.labelDesi.text = designation
                        self.labelName.text = name
                        self.labelOfficerID.text = ID
                        self.labelPlace.text = place
                    }
              }
            }
          }
        }
      }
    
   

}
