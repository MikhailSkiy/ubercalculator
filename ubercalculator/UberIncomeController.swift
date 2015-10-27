//
//  UberIncomeController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 25.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class UberIncomeController: UIViewController {
    
    @IBOutlet weak var grosFaresField: UITextField!
    @IBOutlet weak var tollsField: UITextField!
    @IBOutlet weak var miscField: UITextField!
    @IBOutlet weak var otherIncomeField: UITextField!
    @IBOutlet weak var detailsOfOtherIncome: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeValues(){
        SharingManager.sharedInstance.grossFares = grosFaresField.text!
        SharingManager.sharedInstance.tolls = tollsField.text!
        SharingManager.sharedInstance.misc = miscField.text!
        SharingManager.sharedInstance.otherIncome = otherIncomeField.text!
        SharingManager.sharedInstance.detailsOfOtherIncome = detailsOfOtherIncome.text!
    }
    
    @IBAction func continueBtnPressed(sender: AnyObject) {
        // Save all values
        writeValues()
        let vehicleExpenses = self.storyboard?.instantiateViewControllerWithIdentifier("VehicleExpensesController") as? VehicleExpensesController
        self.navigationController?.pushViewController(vehicleExpenses!, animated: true)
        
    }
}
