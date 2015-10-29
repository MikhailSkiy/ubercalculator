//
//  BasDetailsController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 24.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class BasDetailsController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
    var periodArr = ["Jul - Sept 2015",
    "Oct - Dec 2015",
    "Jan - Mar 2016",
    "Apr - Jun 2016"]
    
    @IBOutlet weak var myScroll: UIScrollView!
    @IBOutlet weak var BasPeriodTextField: UITextField!
    @IBOutlet weak var ABNTextField: UITextField!
    @IBOutlet weak var TFNTextField: UITextField!
    
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var abnAlertLabel: UILabel!
    
    // RadioButtons
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    var yesFlag = false
    var noFlag = false
    
    var myPicker = UIPickerView()
    
    let pageNumber = "4,"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BasPeriodTextField.inputView=myPicker
        myPicker.delegate = self
        myPicker.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isAnyTextFieldsEmpty()->Bool{
       if isBasPeriodEmpty() &&
        isAbnEmpty() {
            return true
       } else {
        return false
        }
    }
    
    func isAbnEmpty()->Bool{
        if ABNTextField.text == "" {
           abnAlertLabel.hidden = false
            return true
        } else {
            abnAlertLabel.hidden = true
            return false
        }
    }
    
    func isBasPeriodEmpty()->Bool{
        if BasPeriodTextField.text == "" {
            alertLabel.hidden = false
            return true
        } else {
            alertLabel.hidden = true
            return false
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        BasPeriodTextField.text = periodArr[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return periodArr.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return periodArr[row]
    }
    
    
    func turnOffYesBtn(){
        yesFlag = false
        let unchecked = UIImage(named:"unchecked")
        yesBtn.setImage(unchecked, forState: .Normal)
    }
    
    func turnOffNoBtn(){
        noFlag = false
        let unchecked = UIImage(named:"unchecked")
        noBtn.setImage(unchecked, forState: .Normal)
    }
    
    
    @IBAction func yesBtnChanged(sender: AnyObject) {
        if (yesFlag){
            yesFlag = false
            let uncheckedImage = UIImage(named: "unchecked")
            yesBtn.setImage(uncheckedImage, forState: .Normal)
        } else {
             let checked = UIImage(named: "checked")
            yesBtn.setImage(checked, forState: .Normal)
            yesFlag = true
        }
        turnOffNoBtn()
    }
    
    @IBAction func noBtnChanged(sender: AnyObject) {
        if (noFlag){
            noFlag = false
            let uncheckedImage = UIImage(named: "unchecked")
            noBtn.setImage(uncheckedImage, forState: .Normal)
        } else {
              let checked = UIImage(named: "checked")
            noBtn.setImage(checked, forState: .Normal)
            noFlag = true
        }
        turnOffYesBtn()
    }
    
    func writeValue(){
        // Check is there current page was selected
         SharingManager.sharedInstance.addToPageHistory(pageNumber)
        
         SharingManager.sharedInstance.BASPeriod = BasPeriodTextField.text!
         SharingManager.sharedInstance.ABN = ABNTextField.text!
         SharingManager.sharedInstance.TFN = TFNTextField.text!
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        myScroll.setContentOffset(CGPointMake(0,250), animated: true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        myScroll.setContentOffset(CGPointMake(0,0), animated: true)
    }
    
    @IBAction func continueBtnPressed(sender: AnyObject) {
        if !isAnyTextFieldsEmpty() {
            // save values
            writeValue()
            
        if yesFlag {
            SharingManager.sharedInstance.refundFromATO = "Yes"
            let bankAccountDetails = self.storyboard?.instantiateViewControllerWithIdentifier("BankAccountDetailsController") as? BankAccountDetailsController
            self.navigationController?.pushViewController(bankAccountDetails!,animated: true)
        }
        
        if (noFlag){
            SharingManager.sharedInstance.refundFromATO = "No"
            let uberIncome = self.storyboard?.instantiateViewControllerWithIdentifier("UberIncomeController") as? UberIncomeController
            self.navigationController?.pushViewController(uberIncome!, animated: true)
        }
    }
    }

 
}



