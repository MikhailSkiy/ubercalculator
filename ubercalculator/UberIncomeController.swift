//
//  UberIncomeController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 25.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class UberIncomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeValues(){
        SharingManager.sharedInstance.grossFares =
        SharingManager.sharedInstance.tolls =
        SharingManager.sharedInstance.misc =
        SharingManager.sharedInstance.otherIncome =
        SharingManager.sharedInstance.detailsOfOtherIncome =
    }
    
    @IBAction func continueBtnPressed(sender: AnyObject) {
        // Save all values
        writeValues()
        let vehicleExpenses = self.storyboard?.instantiateViewControllerWithIdentifier("VehicleExpensesController") as? VehicleExpensesController
        self.navigationController?.pushViewController(vehicleExpenses!, animated: true)
        
    }
}
