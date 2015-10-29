//
//  LastController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 29.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class LastController : UIViewController {
    
    
    @IBOutlet weak var makeModelField: UITextField!
    @IBOutlet weak var purchasePriceField: UITextField!
    @IBOutlet weak var salePrice: UITextField!
    @IBOutlet weak var purchaseSaleDateField: UITextField!
    
    var purchaseFlag = false
    var saleFlag = false
    
    var pageNumber = "11,"
    
    @IBOutlet weak var purchaseBtn: UIButton!
    
    @IBOutlet weak var saleBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func turnOffPurchaseBtn(){
        purchaseFlag = false
        let unchecked = UIImage(named:"unchecked")
       purchaseBtn.setImage(unchecked, forState: .Normal)
    }
    
    
    func turnOffSellBtn(){
        saleFlag = false
        let unchecked = UIImage(named:"unchecked")
       saleBtn.setImage(unchecked, forState: .Normal)
    }
    
    @IBAction func purchaseBtnChanged(sender: AnyObject) {
        if (purchaseFlag){
            let uncheckedImage = UIImage(named: "unchecked")
            purchaseBtn.setImage(uncheckedImage, forState: .Normal)
            purchaseFlag = false
        } else {
            let checked = UIImage(named: "checked")
            purchaseBtn.setImage(checked, forState: .Normal)
            purchaseFlag = true
        }
        turnOffSellBtn()
    }
    
    
    @IBAction func saleBtnChanged(sender: AnyObject) {
        if  saleFlag {
            let uncheckedImage = UIImage(named:"unchecked")
            saleBtn.setImage(uncheckedImage,forState: .Normal)
            saleFlag = false
        } else {
            let checked = UIImage(named:"checked")
            saleBtn.setImage(checked, forState: .Normal)
            saleFlag = true
        }
        turnOffPurchaseBtn()        
    }
    
    
    
    
    @IBAction func pOrSDateEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
   
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        purchaseSaleDateField.text = dateFormatter.stringFromDate(sender.date)
        
        
        let components = NSCalendar.currentCalendar().components([.Day, .Month, .Year], fromDate: sender.date)
        let day = components.day
        let month = components.month
        let year = components.year
        
        SharingManager.sharedInstance.psDateDay = day.description
        SharingManager.sharedInstance.psDateMonth = month.description
        SharingManager.sharedInstance.psDateYear = year.description
        
        
    }
    
    func writeValues(){
        
        SharingManager.sharedInstance.addToPageHistory(pageNumber)
        
        if purchaseFlag {
            SharingManager.sharedInstance.purchaseOrSale = "Purchase"
        }
        if saleFlag {
            SharingManager.sharedInstance.salePrice = "Sale"
        }
        
        SharingManager.sharedInstance.makeAndModel = makeModelField.text!
        SharingManager.sharedInstance.purchasePrice = purchasePriceField.text!
        SharingManager.sharedInstance.salePrice = purchaseSaleDateField.text!
        
    }
    
    @IBAction func goToNextController(sender: AnyObject) {
        
            writeValues()
        
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("OtherExpensesController") as? OtherExpensesController
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
}
