//
//  APNetwork.swift
//  AP Class
//
//  Created by Arun Amuri on 07/03/2020.
//  Copyright © 2020 Arun Amuri. All rights reserved.
//

import Foundation

class APClassMockData {
    
    static let shared = APClassMockData()
    private init() { }
    
    var isStudentLogin = false
    lazy var gardeInforamtionArray: [GradeInformationElement] = {
        return gradeInformationMockData()
    }()
    
    func gradeInformationMockData() -> [GradeInformationElement] {
        
        guard
            let pathString = Bundle(for: type(of: self)).path(forResource: "GradeInforamtion", ofType: "json"),
            let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8),
            let jsonData = jsonString.data(using: .utf8) else {
                fatalError("UnitTestData.json not found")
        }
        guard let gradeInformations = try? JSONDecoder().decode([GradeInformationElement].self, from: jsonData) else {
            fatalError("Unable to convert UnitTestData.json to JSON dictionary")
        }
        
        return gradeInformations
    }
}


