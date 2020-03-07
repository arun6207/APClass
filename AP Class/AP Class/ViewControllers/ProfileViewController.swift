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
    let studentTitles = ["Username", "Email", "Contact Number", "Student ID"]
    let teacherTitles = ["Full Name","Username", "Email", "Contact Number", "Teacher ID"]
    let teacherValues = ["Sample Name","tsample", "tsample@abc.com", "+971501234567", "5213123"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        profileTableView.dataSource = self
    }

}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teacherTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = teacherTitles[indexPath.row]
        cell.detailTextLabel?.text = teacherValues[indexPath.row]
        return cell
    }
    
}
