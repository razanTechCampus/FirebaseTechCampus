//
//  SignUpViewController.swift
//  AdvancedFirebaseTechCampus
//
//  Created by TechCampus on 7/25/19.
//  Copyright © 2019 TechCampus. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupBtnClicked(_ sender: Any) {
        if emailTxtField.text == "" || passwordTxtField.text == "" || confirmPasswordTxtField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Fields cannot be empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else {
            if passwordTxtField.text != confirmPasswordTxtField.text {
                let alertController = UIAlertController(title: "Unmatching passwords", message: "Please retype password", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                Auth.auth().createUser(withEmail: emailTxtField.text!, password: passwordTxtField.text!) { (user, error) in
                    if error == nil {
                        self.performSegue(withIdentifier: "SIGNUP_GO_TO_WELCOME", sender: self)
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(action)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
}
