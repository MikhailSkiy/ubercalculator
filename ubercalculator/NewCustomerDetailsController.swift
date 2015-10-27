//
//  NewCustomerDetailsController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 24.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class NewCustomerDetailsController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    var statesArray = ["Queensland",
        "New South Wales",
        "Victoria",
        "South Australia",
         "Tasmania",
         "Western Australia",
         "Australian Capital Territory",
         "Northern Territory"
    ]
    @IBOutlet weak var nameAlert: UILabel!
    @IBOutlet weak var lastNameAlert: UILabel!
    @IBOutlet weak var birthDateAlert: UILabel!
    @IBOutlet weak var resAlert: UILabel!
    @IBOutlet weak var cityAlert: UILabel!
    @IBOutlet weak var stateAlert: UILabel!
    @IBOutlet weak var postcodeAlert: UILabel!
    
    
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var businessName: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var residentlaAddres: UITextField!
    
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var postcodeField: UITextField!
    
     var myPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stateTextField.inputView=myPicker
        myPicker.delegate = self
        myPicker.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateTextField.text = statesArray[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statesArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return statesArray[row]
    }
    
    @IBAction func birthdayTextEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
 
        birthdayTextField.text = dateFormatter.stringFromDate(sender.date)
        
    }
    
    func isNameEmpty()->Bool{
        if firstNameField.text == "" {
            nameAlert.hidden = false
            return true
        } else {
            nameAlert.hidden = true
            return false
        }
    }
    
    func isLastNameEmpty()->Bool{
        if lastNameField.text == "" {
            lastNameAlert.hidden = false
            return true
        } else {
            lastNameAlert.hidden = true
            return false
        }
    }
    
    
    func isDateOfBirthEmpty()->Bool{
        if birthdayTextField.text == "" {
            birthDateAlert.hidden = false
            return true
        } else {
            birthDateAlert.hidden = true
            return false
        }
    }
    
    func isResAddrEmpty()->Bool{
        if residentlaAddres.text == "" {
            resAlert.hidden = false
            return true
        } else {
            resAlert.hidden = true
            return false
        }
    }
    
    func isCityEmpty()->Bool{
        if cityField.text == "" {
            cityAlert.hidden = false
            return true
        } else {
            cityAlert.hidden = true
            return false
        }
    }
    
    func isStateEmpty()->Bool{
        if stateTextField.text == "" {
            stateAlert.hidden = false
            return true
        } else {
            stateAlert.hidden = true
            return false
        }
    }
    
    func isPostcodeEmpty()->Bool{
        if postcodeField.text == "" {
            postcodeAlert.hidden = false
            return true
        } else {
            postcodeAlert.hidden = true
            return false
        }
    }
    
    func isFieldsEmpty()->Bool{
        if isNameEmpty() ||
            isLastNameEmpty() ||
            isDateOfBirthEmpty() ||
            isResAddrEmpty() ||
        isCityEmpty() ||
        isStateEmpty() ||
            isPostcodeEmpty() {
                return true
        } else {
            return false
        }
    }
    
    
    func writeValue(){
        SharingManager.sharedInstance.firstName = firstNameField.text!
            SharingManager.sharedInstance.lastName = lastNameField.text!
            SharingManager.sharedInstance.businessName = businessName.text!
        SharingManager.sharedInstance.dateOfBirth = birthdayTextField.text!
            SharingManager.sharedInstance.residentialAddress = residentlaAddres.text!
            SharingManager.sharedInstance.city = cityField.text!
            SharingManager.sharedInstance.state = stateTextField.text!
            SharingManager.sharedInstance.postcode = postcodeField.text!
        
    }
    
    @IBAction func continueBtnPressed(sender: UIButton) {
        // if all necessary fields not empty
        if !isFieldsEmpty(){
            // save values in SharingManager
            writeValue()
            
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("BasDetailsController") as? BasDetailsController
        self.navigationController?.pushViewController(next!, animated: true)
        }
        
    }
}
