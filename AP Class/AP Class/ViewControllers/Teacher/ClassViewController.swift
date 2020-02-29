//
//  ClassViewController.swift
//  AP Class
//
//  Created by Arun Amuri on 28/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {

    @IBOutlet weak var classCollectionView: UICollectionView!
    let validColors = [UIColor.apLightBlue, UIColor.apMidLightBlue,UIColor.apMidDarkBlue, UIColor.apDarkBlue]
    let gradesArray = ["12/53", "10/52", "9/53", "14/54", "10/55", "8/50", "12/53", "15/55", "10/51", "9/53", "10/53", "9/52", "9/53", "6/51"]
    var selectedGradeValue: String?
    var travesedCells = [Int: CGRect]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Class"
        classCollectionView.dataSource = self
        classCollectionView.delegate = self
        classCollectionView.automaticallyAdjustsScrollIndicatorInsets = false
    }

}
extension ClassViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gradesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassCollectionViewCell", for: indexPath) as! ClassCollectionViewCell
        cell.gradeLabel.backgroundColor = validColors[indexPath.item % validColors.count]
        
        if (indexPath.item % 2 == 0) {
            if let frame = travesedCells[indexPath.item] {
                cell.frame = frame
            } else {
                cell.frame.origin.y += 30
                travesedCells[indexPath.item] = cell.frame
            }
        }
        cell.gradeLabel.text = "GRADE \n \(gradesArray[indexPath.item])"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClassToGradeSegue",
            let vc = segue.destination as? GradeViewController,
            let gradeValue = selectedGradeValue {
            vc.gradeValue = gradeValue
        }
    }
    
    
}

extension ClassViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.bounds.width/2.0 - 10
        let height: CGFloat = collectionView.bounds.height/3.0 - 3.0
        return CGSize(width: screenWidth, height: height);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedGradeValue = gradesArray[indexPath.item]
        performSegue(withIdentifier: "ClassToGradeSegue", sender: self)
        
    }
}
