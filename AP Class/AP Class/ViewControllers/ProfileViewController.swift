//
//  ProfileViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 23/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileTableView: UITableView!
    fileprivate let studentTitles = ["Full Name","Username", "Email", "Contact Number", "Student ID"]
    fileprivate let studentValues = ["Student name","62030798", "62030798@gmail.com", "+9715589789", "62030798"]
    fileprivate let teacherTitles = ["Full Name","Username", "Email", "Contact Number", "Teacher ID"]
    fileprivate let teacherValues = ["Sample Name","tsample", "tsample@abc.com", "+971501234567", "5213123"]
    
    fileprivate var profileTitles: [String] {
        return APClassMockData.shared.isStudentLogin ? studentTitles : teacherTitles
    }
    fileprivate var profileValues: [String] {
        return APClassMockData.shared.isStudentLogin ? studentValues : teacherValues
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        profileTableView.dataSource = self
    }
    
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = profileTitles[indexPath.row]
        cell.detailTextLabel?.text = profileValues[indexPath.row]
        return cell
    }
}
