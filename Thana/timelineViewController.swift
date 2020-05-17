//
//  timelineViewController.swift
//  Thana
//
//  Created by Gokul Nair on 21/03/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import FirebaseDatabase


class timelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as? cellContrller
                cell?.lblName.text! = name[indexPath.row] as! String
        return cell!
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
     var name:NSArray = []
    
    var recordData = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        databaseHandle = ref?.child("Records").observe(.childAdded, with:{(snapshot) in
           
            //code to execute when a record is added
            //take the value from snapshot and add it to the recordData array
            let record = snapshot.value as? String
            if let actualRecord = record{
           
                //append the data to our recordData array
                self.recordData.append(actualRecord)
                
                self.tableView.reloadData()
            }
            
        })
        
    }
    
}
