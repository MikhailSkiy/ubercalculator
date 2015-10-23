//
//  ViewController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 24.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newCustomerBtn: UIButton!
    @IBOutlet weak var existingCustomerBtn: UIButton!
    
    var isNewCustomer = false
    var isExistingCustomer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func turnOffExistingCustomer(){
        isExistingCustomer = false
        let unchecked = UIImage(named:"unchecked")
        existingCustomerBtn.setImage(unchecked, forState: .Normal)
    }
    
    @IBAction func newCustomerBtnChanged(sender: AnyObject) {
        if (isNewCustomer){
            let uncheckedImage = UIImage(named: "unchecked")
            newCustomerBtn.setImage(uncheckedImage, forState: .Normal)
            isNewCustomer = false
        } else {
            let checked = UIImage(named: "checked")
            newCustomerBtn.setImage(checked, forState: .Normal)
            isNewCustomer = true
        }
        turnOffExistingCustomer()
    }


    @IBAction func existingCustomerBtnChanged(sender: AnyObject) {
    }
}

