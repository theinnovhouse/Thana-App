//
//  signInViewController.swift
//  Thana
//
//  Created by Gokul Nair on 10/03/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class signInViewController: UIViewController, UITextFieldDelegate {
    
    let db = Firestore.firestore()
    

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var designationTextField: UITextField!
    @IBOutlet weak var officerIDTextField: UITextField!
    @IBOutlet weak var PlaceTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        officerIDTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        self.nameTextField.delegate = self
}
    
    @IBAction func signUpButton(_ sender: Any) {
        
        
        if let Name = nameTextField.text, let designation = designationTextField.text, let officerID = officerIDTextField.text, let Place = PlaceTextField.text, let signInUser = Auth.auth().currentUser?.email{
            
            db.collection(thana.FStore.collectionname).addDocument(data: [
     thana.FStore.userName: Name,
     thana.FStore.userDesignation: designation,
     thana.FStore.userPlace:Place,
     thana.FStore.officerID:signInUser
            ]) {
                (error) in
                if let e = error {
                    print("There got some kind of issue,\(e)")
                }
                else{
                    print("Sucessfuly saved!!")
                }
            }
            
        }
        
        
        
        if passwordTextField.text != confirmPasswordTextField.text
        {
            let alertController = UIAlertController(title: "Password Incorrect!", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        else{
            Auth.auth().createUser(withEmail: officerIDTextField.text!, password: passwordTextField.text!){
                (user , error) in
                if error == nil {
                    self.performSegue(withIdentifier: "signInToOption", sender: nil)
                }
                else
                {
                    let alertController = UIAlertController (title: "Error",
                        message: error?.localizedDescription,
                        preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                   
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
//hide keyboard by touching out
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        designationTextField.resignFirstResponder()
        PlaceTextField.resignFirstResponder()
        officerIDTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        return true
    }
}
