//
//  NoLogbookController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 25.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class NoLogbookController: UIViewController{
    

    @IBOutlet weak var uberPercField: UITextField!
    
    @IBAction func btnPressed(sender: AnyObject) {
        SharingManager.sharedInstance.uberUsePercentage = uberPercField.text!
        
        let mapViewControllerObejct = self.storyboard?.instantiateViewControllerWithIdentifier("EstimateCarExpensesController") as? EstimateCarExpensesController
        self.navigationController?.pushViewController(mapViewControllerObejct!, animated: true)
    }
    
}
