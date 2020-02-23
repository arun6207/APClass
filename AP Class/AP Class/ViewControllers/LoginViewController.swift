//
//  LoginViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 23/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinButtonClicked(_ sender: Any) {
        validateUserCredentials()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func validateUserCredentials() {
        
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text else {
                return
        }
        /// both username and password should be more than 2 charcters
        if username.count > 2 && password.count > 2 {
            print("sucessfully logged in")
            let storyBoard = UIStoryboard(name: "Student", bundle: nil)
            guard let vc = storyBoard.instantiateInitialViewController() else { return }
            UIApplication.shared.keyWindow?.rootViewController = vc
        } else {
            showErrorAlert(message: "Enter valid username and password", viewController: self)
        }
    }
   
}

