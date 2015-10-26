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
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
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
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        birthdayTextField.text = dateFormatter.stringFromDate(sender.date)
        
    }
    
    @IBAction func continueBtnPressed(sender: UIButton) {
        // TODO Check that fields are not empty
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("BasDetailsController") as? BasDetailsController
        self.navigationController?.pushViewController(next!, animated: true)
        
    }
}
