//
//  VehicleExpensesController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 25.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class VehicleExpensesController: UIViewController{
    
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    var yesFlag = false
    var noFlag = false
    
    func turnOffNoBtn(){
        noFlag = false
        let unchecked = UIImage(named:"unchecked")
        noBtn.setImage(unchecked, forState: .Normal)
    }
    
    func turnOffYesBtn(){
        yesFlag = false
        let unchecked = UIImage(named:"unchecked")
        yesBtn.setImage(unchecked, forState: .Normal)
    }
    
   
    @IBAction func yesBtnChanged(sender: AnyObject) {
        if (yesFlag){
            let uncheckedImage = UIImage(named: "unchecked")
            yesBtn.setImage(uncheckedImage, forState: .Normal)
            yesFlag = false
        } else {
            let checked = UIImage(named: "checked")
            yesBtn.setImage(checked, forState: .Normal)
            yesFlag = true
        }
        turnOffNoBtn()
    }
 
    
    
    @IBAction func noBtnChanged(sender: AnyObject) {
            if noFlag {
                let uncheckedImage = UIImage(named:"unchecked")
                noBtn.setImage(uncheckedImage,forState: .Normal)
                noFlag = false
            } else {
                let checked = UIImage(named:"checked")
                noBtn.setImage(checked, forState: .Normal)
                noFlag = true
            }
            turnOffYesBtn()
    }

    
    @IBAction func continueBtnChanged(sender: AnyObject) {
        if yesFlag {
            SharingManager.sharedInstance.haveYouKeptLogbook = "Yes"
            let mapViewControllerObejct = self.storyboard?.instantiateViewControllerWithIdentifier("LogbookController") as? LogbookController
            self.navigationController?.pushViewController(mapViewControllerObejct!, animated: true)
            
        }
        
        if noFlag {
            SharingManager.sharedInstance.haveYouKeptLogbook = "No"
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("NoLogbookController") as? NoLogbookController
            self.navigationController?.pushViewController(next!, animated: true)
            
        }
    }
    
    
}
