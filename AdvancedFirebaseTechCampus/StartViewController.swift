//
//  StartViewController.swift
//  AdvancedFirebaseTechCampus
//
//  Created by TechCampus on 7/25/19.
//  Copyright © 2019 TechCampus. All rights reserved.
//

import UIKit
import FirebaseAuth

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "START_GO_TO_WELCOME", sender: nil)
        }
    }

}
