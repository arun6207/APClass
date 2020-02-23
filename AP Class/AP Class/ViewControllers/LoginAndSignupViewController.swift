//
//  LoginAndSignupViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 23/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit

class LoginAndSignupViewController: UIViewController {

    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var welcomeMessageLable: UILabel!
    @IBOutlet weak var welcomeGreetingLabel: UILabel!
    private weak var currentVc: UIViewController?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTags()
        setButtonCorners()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setButtonTags() {
        signButton.tag = 0
        createAccountButton.tag = 1
        forgotPasswordButton.tag = 2
    }
    
    fileprivate func setButtonCorners() {
        createAccountButton.setRounderBorder()
        signButton.setRounderBorder()
    }
    
    @IBAction func buttonClicked(button: UIButton) {
        switch button.tag {
        case 0:
            print("login button clicked")
            self.performSegue(withIdentifier: "login", sender: self)
        case 1:
            print("create button clicked")
            self.performSegue(withIdentifier: "signup", sender: self)
        case 2:
            print("forgot passworfd button clicked")
        default:
            print("button clicked")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
