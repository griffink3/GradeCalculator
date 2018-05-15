//
//  ViewController.swift
//  GradeCalculator
//
//  Created by Griffin on 5/15/18.
//  Copyright © 2018 Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var sectionControl: UISegmentedControl!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var scoreSlider: UISlider!
    @IBOutlet weak var scoreField: UITextField!
    @IBOutlet weak var finalGradeLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var finalGradeField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var hwWeight: Float = 0.0
    var hwScore: Float = 0.0
    var labWeight: Float = 0.0
    var labScore: Float = 0.0
    var midtermWeight: Float = 0.0
    var midtermScore: Float = 0.0
    var projWeight: Float = 0.0
    var projScore: Float = 0.0
    var participationWeight: Float = 0.0
    var participationScore: Float = 0.0
    var finalWeight: Float = 0.0
    var finalScore: Float = 0.0
    var desiredFinal: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weightField.delegate = self
        scoreField.delegate = self
        finalGradeLabel.adjustsFontSizeToFitWidth = true
        finalGradeLabel.textAlignment = .center
        finalGradeLabel.text = "0.00%"
        errorLabel.adjustsFontSizeToFitWidth = true
        errorLabel.textAlignment = .center
        errorLabel.text = " "
        setLocalVar()
        setFields()
        calculateGrade()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLocalVar() {
        hwWeight = appDelegate.hwWeight
        hwScore = appDelegate.hwScore
        labWeight = appDelegate.labWeight
        labScore = appDelegate.labScore
        midtermWeight = appDelegate.midtermWeight
        midtermScore = appDelegate.midtermScore
        projWeight = appDelegate.projWeight
        projScore = appDelegate.projScore
        participationWeight = appDelegate.participationWeight
        participationScore = appDelegate.participationScore
        finalWeight = appDelegate.finalWeight
        finalScore = appDelegate.finalScore
    }
    
    func setGlobalVar() {
        appDelegate.hwWeight = hwWeight
        appDelegate.hwScore = hwScore
        appDelegate.labWeight = labWeight
        appDelegate.labScore = labScore
        appDelegate.midtermWeight = midtermWeight
        appDelegate.midtermScore = midtermScore
        appDelegate.projWeight = projWeight
        appDelegate.projScore = projScore
        appDelegate.participationWeight = participationWeight
        appDelegate.participationScore = participationScore
        appDelegate.finalWeight = finalWeight
        appDelegate.finalScore = finalScore
    }
    
    func setFields() {
        if (sectionControl.selectedSegmentIndex == 0) {
            weightField.text = String(hwWeight)
            scoreField.text = String(hwScore)
            weightSlider.setValue(hwWeight, animated: true)
            scoreSlider.setValue(hwScore, animated: true)
        } else if (sectionControl.selectedSegmentIndex == 1) {
            weightField.text = String(labWeight)
            scoreField.text = String(labScore)
            weightSlider.setValue(labWeight, animated: true)
            scoreSlider.setValue(labScore, animated: true)
        } else if (sectionControl.selectedSegmentIndex == 2) {
            weightField.text = String(midtermWeight)
            scoreField.text = String(midtermScore)
            weightSlider.setValue(midtermWeight, animated: true)
            scoreSlider.setValue(midtermScore, animated: true)
        } else if (sectionControl.selectedSegmentIndex == 3) {
            weightField.text = String(projWeight)
            scoreField.text = String(projScore)
            weightSlider.setValue(projWeight, animated: true)
            scoreSlider.setValue(projScore, animated: true)
        } else if (sectionControl.selectedSegmentIndex == 4) {
            weightField.text = String(participationWeight)
            scoreField.text = String(participationScore)
            weightSlider.setValue(participationWeight, animated: true)
            scoreSlider.setValue(participationScore, animated: true)
        } else if (sectionControl.selectedSegmentIndex == 5) {
            weightField.text = String(finalWeight)
            scoreField.text = String(finalScore)
            weightSlider.setValue(finalWeight, animated: true)
            scoreSlider.setValue(finalScore, animated: true)
        }
    }
    
    func calculateGrade() {
        var grade: Float = 0.0
        var totalWeight: Float = 0.0
        if (hwWeight > 0.0) {
            totalWeight = totalWeight + hwWeight
            grade = grade + (hwScore/100)*hwWeight
        }
        if (labWeight > 0.0) {
            totalWeight = totalWeight + labWeight
            grade = grade + (labScore/100)*labWeight
        }
        if (midtermWeight > 0.0) {
            totalWeight = totalWeight + midtermWeight
            grade = grade + (midtermScore/100)*midtermWeight
        }
        if (projWeight > 0.0) {
            totalWeight = totalWeight + projWeight
            grade = grade + (projScore/100)*projWeight
        }
        if (participationWeight > 0.0) {
            totalWeight = totalWeight + participationWeight
            grade = grade + (participationScore/100)*participationWeight
        }
        if (finalWeight > 0.0) {
            totalWeight = totalWeight + finalWeight
            grade = grade + (finalScore/100)*finalWeight
        }
        finalGradeLabel.text = String(grade*totalWeight) + "%"
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.restorationIdentifier == "weightField") {
            if (Float(textField.text!) == nil) {
                errorLabel.text = "Please enter a valid number"
            } else {
                errorLabel.text = " "
                if (sectionControl.selectedSegmentIndex == 0) {
                    hwWeight = Float(textField.text!)!
                    weightSlider.setValue(hwWeight, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 1) {
                    labWeight = Float(textField.text!)!
                    weightSlider.setValue(labWeight, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 2) {
                    midtermWeight = Float(textField.text!)!
                    weightSlider.setValue(midtermWeight, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 3) {
                    projWeight = Float(textField.text!)!
                    weightSlider.setValue(projWeight, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 4) {
                    participationWeight = Float(textField.text!)!
                    weightSlider.setValue(participationWeight, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 5) {
                    finalWeight = Float(textField.text!)!
                    weightSlider.setValue(finalWeight, animated: true)
                }
            }
        } else if (textField.restorationIdentifier == "scoreField") {
            if (Float(textField.text!) == nil) {
                errorLabel.text = "Please enter a valid number"
            } else {
                errorLabel.text = " "
                if (sectionControl.selectedSegmentIndex == 0) {
                    hwScore = Float(textField.text!)!
                    scoreSlider.setValue(hwScore, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 1) {
                    labScore = Float(textField.text!)!
                    scoreSlider.setValue(labScore, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 2) {
                    midtermScore = Float(textField.text!)!
                    scoreSlider.setValue(midtermScore, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 3) {
                    projScore = Float(textField.text!)!
                    scoreSlider.setValue(projScore, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 4) {
                    participationScore = Float(textField.text!)!
                    scoreSlider.setValue(participationScore, animated: true)
                } else if (sectionControl.selectedSegmentIndex == 5) {
                    finalScore = Float(textField.text!)!
                    scoreSlider.setValue(finalScore, animated: true)
                }
            }
        } else if (textField.restorationIdentifier == "finalGradeField") {
            if (Float(textField.text!) == nil) {
                errorLabel.text = "Please enter a valid number"
            } else {
                desiredFinal = Float(textField.text!)!
                errorLabel.text = " "
            }
        }
        calculateGrade()
    }
    
    // MARK: Actions
    @IBAction func selectSection(_ sender: UISegmentedControl) {
        setFields()
    }
    
    @IBAction func adjustWeightSlider(_ sender: UISlider) {
        if (sectionControl.selectedSegmentIndex == 0) {
            hwWeight = sender.value
            weightField.text = String(hwWeight)
        } else if (sectionControl.selectedSegmentIndex == 1) {
            labWeight = sender.value
            weightField.text = String(labWeight)
        } else if (sectionControl.selectedSegmentIndex == 2) {
            midtermWeight = sender.value
            weightField.text = String(midtermWeight)
        } else if (sectionControl.selectedSegmentIndex == 3) {
            projWeight = sender.value
            weightField.text = String(projWeight)
        } else if (sectionControl.selectedSegmentIndex == 4) {
            participationWeight = sender.value
            weightField.text = String(participationWeight)
        } else if (sectionControl.selectedSegmentIndex == 5) {
            finalWeight = sender.value
            weightField.text = String(finalWeight)
        }
        calculateGrade()
    }
    
    @IBAction func adjustScoreSlider(_ sender: UISlider) {
        if (sectionControl.selectedSegmentIndex == 0) {
            hwScore = sender.value
            weightField.text = String(hwScore)
        } else if (sectionControl.selectedSegmentIndex == 1) {
            labScore = sender.value
            weightField.text = String(labScore)
        } else if (sectionControl.selectedSegmentIndex == 2) {
            midtermScore = sender.value
            weightField.text = String(midtermScore)
        } else if (sectionControl.selectedSegmentIndex == 3) {
            projScore = sender.value
            weightField.text = String(projWeight)
        } else if (sectionControl.selectedSegmentIndex == 4) {
            participationScore = sender.value
            weightField.text = String(participationScore)
        } else if (sectionControl.selectedSegmentIndex == 5) {
            finalScore = sender.value
            weightField.text = String(finalScore)
        }
        calculateGrade()
    }

    @IBAction func reset(_ sender: UIButton) {
        errorLabel.text = " "
        finalGradeLabel.text = "0.00%"
        weightField.text = "0.0"
        scoreField.text = "0.0"
        weightSlider.setValue(0.0, animated: true)
        scoreSlider.setValue(0.0, animated: true)
        hwWeight = 0.0
        hwScore = 0.0
        labWeight = 0.0
        labScore = 0.0
        midtermWeight = 0.0
        midtermScore = 0.0
        projWeight = 0.0
        projScore = 0.0
        participationWeight = 0.0
        participationScore = 0.0
        finalWeight = 0.0
        finalScore = 0.0
        calculateGrade()
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        var needed: Float = 0.0
        var grade: Float = 0.0
        if (hwWeight > 0.0) {
            grade = grade + (hwScore/hwWeight)
        }
        if (labWeight > 0.0) {
            grade = grade + (labScore/labWeight)
        }
        if (midtermWeight > 0.0) {
            grade = grade + (midtermScore/midtermWeight)
        }
        if (projWeight > 0.0) {
            grade = grade + (projScore/projWeight)
        }
        if (participationWeight > 0.0) {
            grade = grade + (participationScore/participationWeight)
        }
        if (finalWeight > 0.0) {
            needed = ((desiredFinal/100) - grade) * finalWeight
        } else {
            needed = 0.0
        }
        appDelegate.neededGrade = needed
        setGlobalVar()
    }
    
    
}

