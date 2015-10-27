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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeValues(){
        SharingManager.sharedInstance.BSBNumber = BSBNumberField.text!
        SharingManager.sharedInstance.bankAccountNumber = BankAccountNumField.text!
        SharingManager.sharedInstance.bankAccountName = BankAcNameField.text!
    }
    
    @IBAction func continueBtnPressed(sender: AnyObject) {
        // Save all values in instance
        writeValues()
        
        let uberIncome = self.storyboard?.instantiateViewControllerWithIdentifier("UberIncomeController") as? UberIncomeController
        self.navigationController?.pushViewController(uberIncome!, animated: true)
    }

}