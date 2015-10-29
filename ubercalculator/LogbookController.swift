//
//  LogbookController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 25.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class LogbookController: UIViewController{
    
    @IBOutlet weak var logbookField: UITextField!
    var pageNumber = "8,"
    
    @IBAction func continueBtnPressed(sender: AnyObject) {
        SharingManager.sharedInstance.logbookPercentage = logbookField.text!
        SharingManager.sharedInstance.addToPageHistory(pageNumber)
        
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("NoLogbookController") as? NoLogbookController
        self.navigationController?.pushViewController(next!, animated: true)
    }
}
