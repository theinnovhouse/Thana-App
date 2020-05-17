//
//  ViewController.swift
//  Thana
//
//  Created by Gokul Nair on 26/02/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var officerIdNo: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        officerIdNo.delegate = self
        passwordTextField.delegate = self
        
        self.officerIdNo.delegate = self
        
    }

    
    @IBAction func logInButton(_ sender: Any) {
    
        Auth.auth().signIn(withEmail: officerIdNo.text!, password: passwordTextField.text!) { (user, error) in
                   if error == nil{
        self.performSegue(withIdentifier: "loginToOption", sender: nil)
                              }
                else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                  
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
                   }
        
    
    
   
    }
  }
    
    //Hide Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //hide keyboard by return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        officerIdNo.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}
