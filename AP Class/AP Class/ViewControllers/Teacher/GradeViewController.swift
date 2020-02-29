//
//  GradeViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 28/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit
import Charts

class GradeViewController: UIViewController {

    var gradeValues = ["90-100","70-80","50-60","below 50"]
    @IBOutlet weak var classWorkPieChart: GradePiChartView!
    @IBOutlet weak var homePieChart: GradePiChartView!
    var selectedTag: Int = 0 
    var gradeValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GRADE \(gradeValue ?? "0")"
        setUphomeWorkPieChart()
        setUpClassWorkPieChart()
    }
    
    func setUphomeWorkPieChart() {
        homePieChart.titleLabel.text = "HOME WORK"
        homePieChart.setDataCount(values: [10,6,5,10])
        homePieChart.piechartView.tag = 1
        homePieChart.delegate = self
    }
    
    func setUpClassWorkPieChart() {
        classWorkPieChart.titleLabel.text = "CLASS WORK"
        classWorkPieChart.setDataCount(values: [16,5,4,9])
        classWorkPieChart.piechartView.tag = 2
        classWorkPieChart.delegate = self
    }
}

extension GradeViewController: GradePiChartViewDelegate {
    func gradePieChartClicked(sender: AnyObject? ,_ values: [String]) {
        if let tag = sender?.view.tag {
            selectedTag = tag
            performSegue(withIdentifier: "GradeChartToInfo", sender: self)
        }
    }
}
