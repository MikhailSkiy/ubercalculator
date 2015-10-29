//
//  BankAccountDetailsController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 25.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//
import UIKit

class BankAccountDetailsController: UIViewController {
    
    @IBOutlet weak var BSBNumberField: UITextField!
    @IBOutlet weak var BankAccountNumField: UITextField!
    @IBOutlet weak var BankAcNameField: UITextField!
    
    @IBOutlet weak var myScroll: UIScrollView!
    let pageNumber="5,"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeValues(){
        SharingManager.sharedInstance.addToPageHistory(pageNumber)
        SharingManager.sharedInstance.BSBNumber = BSBNumberField.text!
        SharingManager.sharedInstance.bankAccountNumber = BankAccountNumField.text!
        SharingManager.sharedInstance.bankAccountName = BankAcNameField.text!
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
        // Save all values in instance
        writeValues()
        
        let uberIncome = self.storyboard?.instantiateViewControllerWithIdentifier("UberIncomeController") as? UberIncomeController
        self.navigationController?.pushViewController(uberIncome!, animated: true)
    }

}