//
//  SignInViewController.swift
//  AdvancedFirebaseTechCampus
//
//  Created by TechCampus on 7/25/19.
//  Copyright © 2019 TechCampus. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.isHidden = true
    }

    @IBAction func signInBtnClicked(_ sender: Any) {
        if emailTxtField.text == "" || passwordTxtField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Fields cannot be empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            Auth.auth().signIn(withEmail: emailTxtField.text!, password: passwordTxtField.text!) { (user, error) in
                if error == nil {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    self.performSegue(withIdentifier: "SIGNIN_GO_TO_WELCOME", sender: self)
                    
                }
                else {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(action)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
