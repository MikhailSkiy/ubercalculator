//
//  VehiclePurchaseController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 26.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit
class VehiclePurchaseController : ViewController {
    
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var purchaseOrSaleDate: UITextField!
    
    var purchaseFlag = false
    var sellFlag = false
   
    
    func turnOffPurchaseBtn(){
        purchaseFlag = false
        let unchecked = UIImage(named:"unchecked")
        yesBtn.setImage(unchecked, forState: .Normal)
    }
    
    
    func turnOffSellBtn(){
        sellFlag = false
        let unchecked = UIImage(named:"unchecked")
        noBtn.setImage(unchecked, forState: .Normal)
    }
    
    
    @IBAction func purchaseBtnChanged(sender: UIButton) {
        if (purchaseFlag){
            let uncheckedImage = UIImage(named: "unchecked")
            yesBtn.setImage(uncheckedImage, forState: .Normal)
            purchaseFlag = false
        } else {
            let checked = UIImage(named: "checked")
            yesBtn.setImage(checked, forState: .Normal)
            purchaseFlag = true
        }
        turnOffSellBtn()
    }
    
    
   
    
    @IBAction func sellBtnChanged(sender: UIButton) {
        if  sellFlag {
            let uncheckedImage = UIImage(named:"unchecked")
            noBtn.setImage(uncheckedImage,forState: .Normal)
            sellFlag = false
        } else {
            let checked = UIImage(named:"checked")
            noBtn.setImage(checked, forState: .Normal)
            sellFlag = true
        }
        turnOffPurchaseBtn()
    }
    
    @IBAction func purchaseOrSaleEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        purchaseOrSaleDate.text = dateFormatter.stringFromDate(sender.date)
        
    }
    
    
    
    @IBAction func cntBtnPressed(sender: AnyObject) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("OtherExpensesController") as? OtherExpensesController
        self.navigationController?.pushViewController(next!, animated: true)
        
    }
 
    
    
}
