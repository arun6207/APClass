//
//  SignUpViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 23/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    // MARK: Lazy variables
    lazy var stdentSignupVC: StudentSignupViewController = {
        guard let controller = instantiateViewController(
            named: "StudentSignupViewController",
            fromStoryboard: "Main",
            withType: StudentSignupViewController.self)
            else { fatalError("Couldn't instantiate PRLoginOptionsViewController.") }
        controller.view.backgroundColor = UIColor.clear
        controller.delegate = self
        return controller
    }()
    
    lazy var teacherSignUpVC: TeacherSignupViewController = {
        guard let controller = instantiateViewController(
            named: "TeacherSignupViewController",
            fromStoryboard: "Main",
            withType: TeacherSignupViewController.self)
            else { fatalError("Couldn't instantiate PRLoginViewController.") }
        controller.view.backgroundColor = UIColor.clear
        controller.delegate = self
        return controller
    }()
    
    
    @IBAction func signupSegmentControllerClicked(_ sender: UISegmentedControl) {
        containerView.subviews.forEach({ $0.removeFromSuperview() })
        if sender.selectedSegmentIndex == 0 {
            addStudentViewController()
        } else {
            addTeacherViewController()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStudentViewController()
    }

    
    fileprivate func addTeacherViewController() {
        containerView.addConstrainedSubview(teacherSignUpVC.view)
        containerView.layer.masksToBounds = true
    }
    fileprivate func addStudentViewController() {
        containerView.addConstrainedSubview(stdentSignupVC.view)
        containerView.layer.masksToBounds = true
    }
}

extension SignUpViewController: SignUpDelegate {
    func dismissSignupContainerView() {
        dismiss(animated: true, completion: nil)
    }
}
