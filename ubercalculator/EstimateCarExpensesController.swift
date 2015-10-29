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
    
    @IBOutlet weak var fuelField: UITextField!
    @IBOutlet weak var insField: UITextField!
    @IBOutlet weak var regField: UITextField!
    @IBOutlet weak var repAndMaint: UITextField!
    @IBOutlet weak var cleaningField: UITextField!
    
    var pageNumber = "10,"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    
    func writeValues(){
        SharingManager.sharedInstance.addToPageHistory(pageNumber)
        SharingManager.sharedInstance.fuel = fuelField.text!
         SharingManager.sharedInstance.insurance = insField.text!
         SharingManager.sharedInstance.registration = regField.text!
         SharingManager.sharedInstance.repAndMaint = repAndMaint.text!
         SharingManager.sharedInstance.cleaning = cleaningField.text!
    }
    
    @IBAction func continueBtnPressed(sender: UIButton) {
        writeValues()
        
        if yesFlag {
             SharingManager.sharedInstance.didYouPurchase = "Yes"
            
//            
//            let mapViewControllerObejct = self.storyboard?.instantiateViewControllerWithIdentifier("VehiclePurchaseController") as? VehiclePurchaseController
//            self.navigationController?.pushViewController(mapViewControllerObejct!, animated: true)
            
                  let next = self.storyboard?.instantiateViewControllerWithIdentifier("LastController") as? LastController
                   self.navigationController?.pushViewController(next!, animated: true)
            
        }
        
        if noFlag {
             SharingManager.sharedInstance.didYouPurchase = "No"
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("OtherExpensesController") as? OtherExpensesController
            self.navigationController?.pushViewController(next!, animated: true)
            
        }
    }
    
 

    
    
}
