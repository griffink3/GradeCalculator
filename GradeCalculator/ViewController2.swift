//
//  ViewController2.swift
//  GradeCalculator
//
//  Created by Griffin on 5/18/18.
//  Copyright © 2018 Griffin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var semesterControl: UISegmentedControl!
    @IBOutlet weak var weightField1: UITextField!
    @IBOutlet weak var weightField2: UITextField!
    @IBOutlet weak var weightField3: UITextField!
    @IBOutlet weak var weightField4: UITextField!
    @IBOutlet weak var weightField5: UITextField!
    @IBOutlet weak var weightField6: UITextField!
    @IBOutlet weak var gradePicker1: UIPickerView!
    @IBOutlet weak var gradePicker2: UIPickerView!
    @IBOutlet weak var gradePicker3: UIPickerView!
    @IBOutlet weak var gradePicker4: UIPickerView!
    @IBOutlet weak var gradePicker5: UIPickerView!
    @IBOutlet weak var gradePicker6: UIPickerView!
    @IBOutlet weak var addSemesterButton: UIButton!
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var semesterToGrades: Dictionary = [Int: Semester]()
    var nextSem: Int = 2
    var activeField: UITextField?
    let pickerData = ["A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gpaLabel.adjustsFontSizeToFitWidth = true
        gpaLabel.text = "0.00"
        gpaLabel.textAlignment = .center
        setDict()
        weightField1.delegate = self
        weightField2.delegate = self
        weightField3.delegate = self
        weightField4.delegate = self
        weightField5.delegate = self
        weightField6.delegate = self
        gradePicker1.delegate = self
        gradePicker1.dataSource = self
        gradePicker2.delegate = self
        gradePicker2.dataSource = self
        gradePicker3.delegate = self
        gradePicker3.dataSource = self
        gradePicker4.delegate = self
        gradePicker4.dataSource = self
        gradePicker5.delegate = self
        gradePicker5.dataSource = self
        gradePicker6.delegate = self
        gradePicker6.dataSource = self
        errorLabel.adjustsFontSizeToFitWidth = true
        errorLabel.textAlignment = .center
        errorLabel.text = " "
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if (activeField != nil) {
            if (activeField?.restorationIdentifier == "class6Weight") {
                print("HERE1")
                if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                    if self.view.frame.origin.y == 0 {
                        self.view.frame.origin.y = self.view.frame.origin.y - keyboardSize.height
                    }
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setDict() {
        semesterToGrades[0] = Semester(semesterNum: 0)
        semesterToGrades[1] = Semester(semesterNum: 1)
    }
    
    func calculateGPA() {
        var GPA: Float = 0.0
        var totalWeight: Float = 0.0
        for (_, semester) in semesterToGrades {
            for (_, singleClass) in semester.classes {
                totalWeight = totalWeight + singleClass.weight
                var grade: Float = 0.0
                if (singleClass.grade == "A") {
                    grade = 4.0 * singleClass.weight
                } else if (singleClass.grade == "A-") {
                    grade = 3.70
                } else if (singleClass.grade == "B+") {
                    grade = 3.30
                } else if (singleClass.grade == "B") {
                    grade = 3.00
                } else if (singleClass.grade == "B-") {
                    grade = 2.70
                } else if (singleClass.grade == "C+") {
                    grade = 2.30
                } else if (singleClass.grade == "C") {
                    grade = 2.00
                } else if (singleClass.grade == "C-") {
                    grade = 1.70
                } else if (singleClass.grade == "D+") {
                    grade = 1.30
                } else if (singleClass.grade == "D") {
                    grade = 1.00
                } else if (singleClass.grade == "F") {
                    grade = 0.00
                }
                GPA = GPA + (grade  * singleClass.weight)
            }
        }
        if (totalWeight != 0.0) {
            print(GPA)
            GPA = (GPA * 4.0) / (totalWeight * 4.0)
            print(GPA)
            gpaLabel.text = String(GPA)
        }
    }
    
    func setGrade(classNum: Int, row: Int) {
        if (row == 0) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "A")
                }
            }
        } else if (row == 1) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "A-")
                }
            }
        } else if (row == 2) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "B+")
                }
            }
        } else if (row == 3) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "B")
                }
            }
        } else if (row == 4) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "B-")
                }
            }
        } else if (row == 5) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "C+")
                }
            }
        } else if (row == 6) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "C")
                }
            }
        } else if (row == 7) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "C-")
                }
            }
        } else if (row == 8) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "D+")
                }
            }
        } else if (row == 9) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "D")
                }
            }
        } else if (row == 10) {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[classNum]?.changeGrade(grade: "F")
                }
            }
        }
    }
    
    // MARK: UIPickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.restorationIdentifier == "picker1") {
            setGrade(classNum: 1, row: row)
        } else if (pickerView.restorationIdentifier == "picker2") {
            setGrade(classNum: 2, row: row)
        } else if (pickerView.restorationIdentifier == "picker3") {
            setGrade(classNum: 3, row: row)
        } else if (pickerView.restorationIdentifier == "picker4") {
            setGrade(classNum: 4, row: row)
        } else if (pickerView.restorationIdentifier == "picker5") {
            setGrade(classNum: 5, row: row)
        } else if (pickerView.restorationIdentifier == "picker6") {
            setGrade(classNum: 6, row: row)
        }
        calculateGPA()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (Float(textField.text!) == nil) {
            errorLabel.text = "Please enter a valid number"
        } else if (textField.restorationIdentifier == "class1Weight") {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[1]?.changeWeight(weight: Float(textField.text!)!)
                }
            }
        } else if (textField.restorationIdentifier == "class2Weight") {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[2]?.changeWeight(weight: Float(textField.text!)!)
                }
            }
        } else if (textField.restorationIdentifier == "class2Weight") {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[3]?.changeWeight(weight: Float(textField.text!)!)
                }
            }
        } else if (textField.restorationIdentifier == "class4Weight") {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[4]?.changeWeight(weight: Float(textField.text!)!)
                }
            }
        } else if (textField.restorationIdentifier == "class5Weight") {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[5]?.changeWeight(weight: Float(textField.text!)!)
                }
            }
        } else if (textField.restorationIdentifier == "class6Weight") {
            for (semNum, semester) in semesterToGrades {
                if (semesterControl.selectedSegmentIndex == semNum) {
                    semester.classes[6]?.changeWeight(weight: Float(textField.text!)!)
                }
            }
        }
        errorLabel.text = " "
        calculateGPA()
        activeField = nil
    }
    
    // MARK: Actions
    @IBAction func addSemester(_ sender: Any) {
        semesterControl.insertSegment(withTitle: String(nextSem+1), at: nextSem, animated: true)
        semesterToGrades[nextSem] = Semester(semesterNum: nextSem)
        nextSem = nextSem + 1
    }
    
    @IBAction func reset(_ sender: UIButton) {
        gradePicker1.selectRow(0, inComponent: 0, animated: true)
        gradePicker2.selectRow(0, inComponent: 0, animated: true)
        gradePicker3.selectRow(0, inComponent: 0, animated: true)
        gradePicker4.selectRow(0, inComponent: 0, animated: true)
        gradePicker5.selectRow(0, inComponent: 0, animated: true)
        gradePicker6.selectRow(0, inComponent: 0, animated: true)
        weightField1.text = "0.0"
        weightField2.text = "0.0"
        weightField3.text = "0.0"
        weightField4.text = "0.0"
        weightField5.text = "0.0"
        weightField6.text = "0.0"
        gpaLabel.text = "0.00"
        errorLabel.text = " "
        semesterControl.removeAllSegments()
        semesterToGrades.removeAll()
        semesterControl.insertSegment(withTitle: "1", at: 0, animated: true)
        semesterControl.insertSegment(withTitle: "2", at: 1, animated: true)
        setDict()
    }
    
    
}
