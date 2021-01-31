//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Michael Chen on 12/24/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

//Boss class tells interns class what he need to do
protocol RecalculateDelegate {
    func recalculateTapped()
}

class ResultsViewController: UIViewController {
    
    var calculatedResult = "0.0"
    var numberOfPeople = 2
    var tipPercentage = 10
    
    //itern
    var resultViewDelegate: RecalculateDelegate!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        totalLabel.text = calculatedResult
        settingsLabel.text = "Split between \(numberOfPeople) people with \(tipPercentage)% tip"
        
    }
    
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        resultViewDelegate.recalculateTapped()
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
