//
//  OtherExpensesController.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 27.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

import UIKit
class OtherExpensesController : UIViewController{
    
    
    @IBOutlet weak var mobilePhonesBils: UITextField!
    
    @IBOutlet weak var percOfPhoneForUberField: UITextField!
    
    @IBOutlet weak var accBookField: UITextField!
    
    @IBOutlet weak var fplField: UITextField!
    
    @IBOutlet weak var reiderSupField: UITextField!
    @IBOutlet weak var parkingField: UITextField!
    
    @IBOutlet weak var stationaryField: UITextField!
    
    
    @IBOutlet weak var tollsField: UITextField!
    @IBOutlet weak var itherExpField: UITextField!
    @IBOutlet weak var infoAboutOtherExpField: UITextField!
   func writeValues(){
    SharingManager.sharedInstance.mobilePhoneBills = mobilePhonesBils.text!
    
    SharingManager.sharedInstance.percOfPhoneForUber =
        percOfPhoneForUberField.text!
    
    SharingManager.sharedInstance.accBook = accBookField.text!
    
    SharingManager.sharedInstance.fpl = fplField.text!
    SharingManager.sharedInstance.parking = parkingField.text!
    
    SharingManager.sharedInstance.riderSup = reiderSupField.text!
    
    SharingManager.sharedInstance.stationaryAndOffice =
        stationaryField.text!
    
    SharingManager.sharedInstance.tollsOther = tollsField.text!
    
    SharingManager.sharedInstance.otherExp = itherExpField.text!
    
    SharingManager.sharedInstance.informationAboutOtherExp = infoAboutOtherExpField.text!
    
    }
    
}
