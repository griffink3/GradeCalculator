//
//  Semester.swift
//  GradeCalculator
//
//  Created by Griffin on 5/18/18.
//  Copyright © 2018 Griffin. All rights reserved.
//

import Foundation

class Semester {
    
    // MARK: Properties
    var num: Int
    var classes: Dictionary = [Int: Class]()
    
    // MARK: Initialization
    init(semesterNum: Int) {
        self.num = semesterNum
        setUpClasses()
    }
    
    func setUpClasses() {
        classes[1] = Class(classNum: 1, weight: 0, grade: "A")
        classes[2] = Class(classNum: 2, weight: 0, grade: "A")
        classes[3] = Class(classNum: 3, weight: 0, grade: "A")
        classes[4] = Class(classNum: 4, weight: 0, grade: "A")
        classes[5] = Class(classNum: 5, weight: 0, grade: "A")
        classes[6] = Class(classNum: 6, weight: 0, grade: "A")
    }
    
    func changeClassWeight(classNum: Int, weight: Float) {
        classes[classNum]?.changeWeight(weight: weight)
    }
    
    func changeGrade(classNum: Int, grade: String) {
        classes[classNum]?.changeGrade(grade: grade)
    }
  
}
