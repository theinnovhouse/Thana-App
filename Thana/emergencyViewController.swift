//
//  emergencyViewController.swift
//  Thana
//
//  Created by Gokul Nair on 22/03/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class emergencyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var name:NSArray = []
    var imageArr:NSArray = []
    var designation:NSArray = []
    var email:NSArray = []
    var PhoneNum:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name = ["Shri Ram Pal Pawar IPS", "Shri Vivek Gogia IPS", "Shri Sanjay Mathur IPS", "Shri Sanjeev Kumar", "Shri A.Mohan Krishna", "Dr. Prasun Gupta", "Sri S.K Saxena", "Shri Vijay singh", "Shri Dhirendra Kumar Yadav", "Shri Pradip De IPS"]

        imageArr = [ UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!,UIImage(named: "5")!,UIImage(named: "6")!,UIImage(named: "7")!,UIImage(named: "8")!,UIImage(named: "9")!,UIImage(named: "10")!]
    
        designation = ["Director", "Jt.Director (A&T)", "Jt.Director (CCTNS)", "Chief Statistician", "Dy.Director (CCTNS-III/CFPB)","Dy.Director (CCTNS-II)", "Dy.Director (CCTNS-I/DCT)", "Dy.Director (Admn.)","Dy.Director (IT security)", "Asstt.Director (Training)"]
        
        email = ["director@ncrb.nic.in", "jdadmin@ncrb.nic.in", "dcctns@ncrb.nic.in", "csncrb@ncrb.nic.in", "amkrishna@ncrb.nic.in", "prashun@ncrb.nic.in", "sksaxena@ncrb.nic.in", "ddadmn@ncrb.nic.in", "dkyadav@ncrb.nic.in", "pradipde@ncrb.nic.in"]
        PhoneNum = ["011-26782253", "011-26782547", "011-26782252", "011-2675508", "011-26735402", "011-26735637","011-26735640","011-26735507","011-26735605","011-26735432",]
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.viewDidLoad()
    }
    
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           
           return 120
       }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cellContrller
         cell?.lblName.text! = name[indexPath.row] as! String
        cell?.imgImage.image = imageArr[indexPath.row] as? UIImage
         
        cell?.imgImage.image = (imageArr[indexPath.row] as! UIImage)
        
        cell?.lblName.text! = name[indexPath.row] as! String
        
        return cell!
    
    }

      var indexPos = 0
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
                indexPos=indexPath.row
                performSegue(withIdentifier: "segue", sender: self)
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
            let vc = segue.destination as! detailEmergencyController
            vc.getImage = self.imageArr[indexPos] as! UIImage
            vc.getname = self.name[indexPos] as! String
            vc.getdesignation = self.designation[indexPos] as! String
            vc.getemail = self.email[indexPos] as! String
            vc.getPhoneNum = self.PhoneNum[indexPos] as! String
    }

        
    }



