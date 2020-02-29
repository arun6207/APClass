//
//  GradeInfo.swift
//  AP Class
//
//  Created by Arun Amuri on 29/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import Foundation

struct Section {
  var name: String
  var items: [Item]
  var collapsed: Bool
    
  init(name: String, items: [Item], collapsed: Bool = false) {
    self.name = name
    self.items = items
    self.collapsed = collapsed
  }
}
    
public struct Item {
    var name: String
    var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}
