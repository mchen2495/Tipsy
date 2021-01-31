//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipAmount = 0.10
    var bill = 0.0
    var numberOfPeople = 2
    var finalResult = "0.0"

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var splitStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tenPctButton.isSelected = true

        let tapper = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapper)
    }
    
    //make keyboard disapper when tapped on background
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
        billTextField.resignFirstResponder()
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //print(sender.tag)
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleWithoutPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleWithoutPercentSign)!
        tipAmount =  buttonTitleAsNumber / 100
        
        
        
        
//        if sender.tag == 0{
//            zeroPctButton.isSelected = true
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = false
//        }
//        else if sender.tag == 1{
//            zeroPctButton.isSelected = false
//            tenPctButton.isSelected = true
//            twentyPctButton.isSelected = false
//        }
//        else{
//            zeroPctButton.isSelected = false
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = true
//        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        
        if let amount = billTextField.text {
            bill = Double((amount as NSString).floatValue)
            
            let result = bill * (1 + tipAmount) / Double(numberOfPeople)
            
            finalResult = String(format: "%.2f", result)
            
            print(finalResult)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
//        if zeroPctButton.isSelected {
//            print("0.0")
//            tipAmount = 0.0
//        }
//        else if tenPctButton.isSelected{
//            print("0.1")
//            tipAmount = 0.1
//            bill = bill + (bill * 0.1)
//        }
//        else{
//            print("0.2")
//            tipAmount = 0.2
//            bill = bill + (bill * 0.2)
//        }
//
//
//        let result = bill/Double(numberOfPeople)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult"{
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.calculatedResult = finalResult
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tipPercentage = Int(tipAmount * 100)
            destinationVC.resultViewDelegate = self
            
        }
        
    }
    
}

//intern doing that boss tell it to do
extension CalculatorViewController: RecalculateDelegate{
    
    /*when the recalculate button is tapped on resultViewController we want to
     reset the calculatorView screen
    */
    func recalculateTapped() {
        billTextField.text = nil
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = true
        twentyPctButton.isSelected = false
        splitStepper.value = 2
        splitNumberLabel.text = "2"
        numberOfPeople = 2
        tipAmount =  10 / 100
    }
    
}

