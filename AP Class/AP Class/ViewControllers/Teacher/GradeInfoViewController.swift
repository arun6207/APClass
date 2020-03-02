//
//  GradeInfoViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 29/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit

class GradeInfoViewController: UIViewController {
   
    var slectedPieChartData: [Double]!
    @IBOutlet weak var gradeInfoPieChart: GradePiChartView!
    @IBOutlet weak var gradeInfoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradeInfoTableView.dataSource = self
        gradeInfoTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gradeInfoPieChart.setDataCount(values: slectedPieChartData)
    }
    func createSectionHeaderView() {
        
    }
}

extension GradeInfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        gradeValues.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        gradeValues[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GradeInfoTableViewCell", for: indexPath) as? GradeInfoTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.text = "Student\(indexPath.row)"
        return cell
    }
}

extension GradeInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          70.0
      }
}

