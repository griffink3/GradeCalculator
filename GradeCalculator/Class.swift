//
//  Class.swift
//  GradeCalculator
//
//  Created by Griffin on 5/18/18.
//  Copyright © 2018 Griffin. All rights reserved.
//

import Foundation

class Class {
    
    // MARK: Properties
    var num: Int
    var weight: Float
    var grade: String
    
    // MARK: Initialization
    init(classNum: Int, weight: Float, grade: String) {
        self.num = classNum
        self.weight = weight
        self.grade = grade
    }
    
    func changeWeight(weight: Float) {
        self.weight = weight
    }
    
    func changeGrade(grade: String) {
        self.grade = grade
    }
    
}
