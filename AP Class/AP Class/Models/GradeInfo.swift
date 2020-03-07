//
//  GradeInfo.swift
//  AP Class
//
//  Created by Arun Amuri on 29/02/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import Foundation

// MARK: - GradeInformationElement
struct GradeInformationElement: Codable {
    let gradeID: Int
    let gradeName: String
    var isCollapsed: Bool
    let students: [Student]
}

// MARK: - Student
struct Student: Codable {
    let name: String
    let id, marks: Int
}

typealias GradeInformation = [GradeInformationElement]
 



