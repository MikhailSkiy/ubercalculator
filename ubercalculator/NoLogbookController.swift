//
//  NoLogbookController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 25.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class NoLogbookController: UIViewController{
    
    @IBOutlet weak var percText: UITextField!
    var pageNumber = "9,"

    @IBAction func cntPresd(sender: AnyObject) {
        
        SharingManager.sharedInstance.uberUsePercentage = percText.text!
        SharingManager.sharedInstance.addToPageHistory(pageNumber)
        
        let newLink = self.storyboard?.instantiateViewControllerWithIdentifier("EstimateCarExpensesController") as? EstimateCarExpensesController
        self.navigationController?.pushViewController(newLink!, animated: true)
    }
    
  
    
}
