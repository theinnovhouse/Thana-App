//
//  addViewController.swift
//  Thana
//
//  Created by Gokul Nair on 21/03/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase



class addViewController: UIViewController {
    
    
    let db = Firestore.firestore()
   
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var policeStationName: UITextField!
    @IBOutlet weak var nameOfApli: UITextField!
    @IBOutlet weak var education: UITextField!
    @IBOutlet weak var addressText: UITextView!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var fatherName: UITextField!
    @IBOutlet weak var spouseName: UITextField!
    @IBOutlet weak var MotherName: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var skinColour: UITextField!
    @IBOutlet weak var bodyType: UITextField!
    @IBOutlet weak var historyOfCrime: UITextView!
    @IBOutlet weak var awardsAnnounced: UITextView!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var DOB: UITextField!
    
    
  
    
    
    
    
    let datepicker = UIDatePicker()
    let datepicker2 = UIDatePicker()
    
    @IBAction func registerButton(_ sender: UIButton) {
     
        if (dateTextField.text != ""  && nameOfApli.text != ""  && addressText.text != "" && phoneNo.text != ""  &&  DOB.text != "")
        {
        
       if let date = dateTextField.text,
        let policeStation = policeStationName.text,
        let name = nameOfApli.text,
        let gender = genderText.text,
        let birthDate = DOB.text,
        let father = fatherName.text,
        let mother = MotherName.text,
        let spouse = spouseName.text,
        let education = education.text,
        let address = addressText.text,
        let height = height.text,
        let weight = weight.text,
        let skinColour = skinColour.text,
        let body = bodyType.text,
        let historyCrime = historyOfCrime.text,
        let awardsAnnounced = awardsAnnounced.text,
        let phone = phoneNo.text,
        let emailID = emailID.text,
        let signInUser = Auth.auth().currentUser?.email{
        
           db.collection(thana.record.collectionname).addDocument(data: [
        thana.FStore.officerID: signInUser,
        thana.record.dateOfRegistration: date,
        thana.record.policeStation: policeStation,
        thana.record.emailID: emailID,
        thana.record.NameOfComp:name,
        thana.record.gender: gender,
        thana.record.father: father,
        thana.record.address:address,
        thana.record.PhoneNo:phone,
        thana.record.education: education,
        thana.record.spouse: spouse,
        thana.record.mother: mother,
        thana.record.height: height,
        thana.record.dateOfBirth: birthDate,
        thana.record.weight: weight,
        thana.record.skinColour: skinColour,
        thana.record.bodyType: body,
        thana.record.historyOfCrimes: historyCrime,
        thana.record.Awards: awardsAnnounced
            
               ]) {
                   (error) in
                   if let e = error {
                       print("There got some kind of issue,\(e)")
                   }
                   else{
                       print("Sucessfuly saved!!") 
                    
                    let alertController = UIAlertController(title: "Record Added", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                          
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    self.clear()
                    
                   }
               }
        }
       
    }
}
    
  
    
    func clear()
    {
        self.dateTextField.text = ""
         self.policeStationName.text = ""
         self.nameOfApli.text?.removeAll()
         self.genderText.text?.removeAll()
         self.education.text?.removeAll()
         self.phoneNo.text?.removeAll()
         self.DOB.text?.removeAll()
         self.emailID.text?.removeAll()
         self.addressText.text?.removeAll()
         self.fatherName.text?.removeAll()
         self.MotherName.text?.removeAll()
         self.spouseName.text?.removeAll()
         self.height.text?.removeAll()
         self.weight.text?.removeAll()
         self.skinColour.text?.removeAll()
         self.bodyType.text?.removeAll()
         self.historyOfCrime.text?.removeAll()
         self.awardsAnnounced.text?.removeAll()
        
    }
    
     override func viewDidLoad() {
         super.viewDidLoad()
        
        createDatePicker()
        createdatepicker_2()
     }
      
    
    func createDatePicker()
    {
        dateTextField.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn],animated: true)
        
        dateTextField.inputAccessoryView = toolbar
        
        dateTextField.inputView = datepicker
        
        datepicker.datePickerMode = .date
    }
   
 

func createdatepicker_2() {
     
    DOB.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn],animated: true)
        
        DOB.inputAccessoryView = toolbar
        
        DOB.inputView = datepicker2
        
        datepicker2.datePickerMode = .date
    }
   

@objc func donePressed()
   {
       let formatter = DateFormatter()
       formatter.dateStyle = .full
       formatter.timeStyle = .none
       
       dateTextField.text = formatter.string(from: datepicker.date)
    DOB.text = formatter.string(from: datepicker2.date)
       self.view.endEditing(true)
   }
    
}
