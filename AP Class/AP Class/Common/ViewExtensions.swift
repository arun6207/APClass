//
//  ViewExtensions.swift
//  AP Class
//
//  Created by Arun Amuri on 23/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setRounderBorder() {
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
    func addConstrainedSubview(_ view: UIView) {
        // Add view as subview
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Constrain view to sides of self
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = view
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                           options: [], metrics: nil, views: viewBindingsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                           options: [], metrics: nil, views: viewBindingsDict))
    }
}
