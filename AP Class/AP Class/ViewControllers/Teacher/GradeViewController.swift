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
    @IBOutlet weak var classWorkPieChart: GradePiChartView!
    @IBOutlet weak var homePieChart: GradePiChartView!
    var classWorkValues: [Double] = [16,5,4,9]
    var homeWorkValues: [Double] = [10,6,5,10]
    var selectedValues: [Double]?
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
        homePieChart.setDataCount(values: homeWorkValues)
        homePieChart.piechartView.tag = 1
        homePieChart.delegate = self
    }
    
    func setUpClassWorkPieChart() {
        classWorkPieChart.titleLabel.text = "CLASS WORK"
        classWorkPieChart.setDataCount(values: classWorkValues)
        classWorkPieChart.piechartView.tag = 2
        classWorkPieChart.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GradeChartToInfo" {
            if let vc = segue.destination as? GradeInfoViewController,
                let values = selectedValues {
                vc.slectedPieChartData = values
            }
        }
    }
}

extension GradeViewController: GradePiChartViewDelegate {
    func gradePieChartClicked(sender: AnyObject? ,_ values: [Double]) {
        if let tag = sender?.view.tag {
            selectedTag = tag
            selectedValues = values
            performSegue(withIdentifier: "GradeChartToInfo", sender: self)
        }
    }
}
