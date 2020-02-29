//
//  GradePipiechartView.swift
//  AP Class
//
//  Created by Arun Amuri on 28/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit
import Charts

protocol GradePiChartViewDelegate: AnyObject {
    func gradePieChartClicked(sender: AnyObject? ,_ values: [String])
}

class GradePiChartView: UIView {
    
    @IBOutlet weak var piechartView: PieChartView!
    @IBOutlet weak var titleLabel: UILabel!
    let gradeValues = ["90-100","70-80","50-60","below 50"]
    let nibName = "GradePiChartView"
    var view : UIView!
    weak var delegate: GradePiChartViewDelegate?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
    }

    func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        setUpChartView()
        addTapGestureToPiechart()
    }

    func loadViewFromNib() ->UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func addTapGestureToPiechart() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        piechartView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        delegate?.gradePieChartClicked(sender: sender, gradeValues)
    }
    
    func setUpChartView() {
        piechartView.usePercentValuesEnabled = false
        piechartView.drawSlicesUnderHoleEnabled = false
        piechartView.holeRadiusPercent = 0.58
        piechartView.transparentCircleRadiusPercent = 0.61
        piechartView.chartDescription?.enabled = false
        piechartView.drawCenterTextEnabled = false
        piechartView.drawHoleEnabled = false
        piechartView.rotationAngle = 0
        piechartView.rotationEnabled = false
        piechartView.highlightPerTapEnabled = false
        piechartView.drawEntryLabelsEnabled = false
        piechartView.isExclusiveTouch = false
        piechartView.usePercentValuesEnabled = false

        let l = piechartView.legend
        l.horizontalAlignment = .center
        l.verticalAlignment = .top
        l.orientation = .horizontal
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
    }
    
    func setDataCount(values: [Double]) {
        
        let entries = [PieChartDataEntry(value: values[0], label: gradeValues[0]),
                       PieChartDataEntry(value: values[1], label: gradeValues[1]),
                       PieChartDataEntry(value: values[2], label: gradeValues[2]),
                       PieChartDataEntry(value: values[3], label: gradeValues[3])]
        
        
        let set = PieChartDataSet(entries: entries, label: "")
        set.drawIconsEnabled = false
        set.sliceSpace = 1
        
        set.colors = [UIColor.apLightBlue, UIColor.apMidLightBlue,UIColor.apMidDarkBlue, UIColor.apDarkBlue]
        
        let data = PieChartData(dataSet: set)
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .bold))
        data.setValueTextColor(.white)
        
        piechartView.data = data
        piechartView.highlightValues(nil)
    }
}
