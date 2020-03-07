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
    var gradeinfo = APClassMockData.shared.gardeInforamtionArray
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
        gradeinfo.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        gradeinfo[section].gradeName
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return gradeinfo[section].isCollapsed ? gradeinfo[section].students.count : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GradeInfoTableViewCell", for: indexPath) as? GradeInfoTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.text = gradeinfo[indexPath.section].students[indexPath.row].name
        return cell
    }
    
}

extension GradeInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = gradeValues[section]
        header.arrowLabel.text = ">"
        header.setCollapsed(gradeinfo[section].isCollapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
}

extension GradeInfoViewController: CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !gradeinfo[section].isCollapsed
        // Toggle collapse
        gradeinfo[section].isCollapsed = collapsed
        header.setCollapsed(collapsed)
        
        gradeInfoTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
}

