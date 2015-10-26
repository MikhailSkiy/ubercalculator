//
//  EstimateCarExpensesController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 26.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit
class EstimateCarExpensesController : UIViewController{
    
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    
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
    
    
    @IBAction func yesBtnChanged(sender: UIButton) {
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
  
    
    @IBAction func noBtnChanged(sender: UIButton) {
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
    
    
    @IBAction func continueBtnPressed(sender: UIButton) {
        if yesFlag {
            let mapViewControllerObejct = self.storyboard?.instantiateViewControllerWithIdentifier("VehiclePurchaseController") as? VehiclePurchaseController
            self.navigationController?.pushViewController(mapViewControllerObejct!, animated: true)
            
        }
        
        if noFlag {
            
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("OtherExpensesController") as? OtherExpensesController
            self.navigationController?.pushViewController(next!, animated: true)
            
        }
    }
    
 

    
    
}
