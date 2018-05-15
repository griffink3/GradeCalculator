//
//  ViewController1.swift
//  GradeCalculator
//
//  Created by Griffin on 5/15/18.
//  Copyright © 2018 Griffin. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var resultsLabel: UILabel!
    
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultsLabel.adjustsFontSizeToFitWidth = true
        resultsLabel.textAlignment = .center
        resultsLabel.text = String(appDelegate.neededGrade) + "%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
