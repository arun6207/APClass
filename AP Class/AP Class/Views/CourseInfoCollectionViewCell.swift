//
//  CourseInfoCollectionViewCell.swift
//  AP Class
//
//  Created by Arun Amuri on 24/03/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import UIKit

class CourseInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var infoLable: UILabel!
    
    func populate(with item: String) {
        infoLable.text = item
        backgroundColor = UIColor.lightGray
    }

}
