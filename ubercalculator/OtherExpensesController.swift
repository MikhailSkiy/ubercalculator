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
    
    var session: NSURLSession!
    var pageNumber = "12"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
    
    @IBAction func submit(sender: AnyObject) {
       writeValues()
        
        SharingManager.sharedInstance.addToPageHistory(pageNumber)
        
        /* 2. Build the URL */
        
//        rowName != nil ?rowName!.stringFromCamelCase():""
        
        let urlString = "https://docs.google.com/forms/d/1wkl4wwmYcWhB_CcVUC3DLACXcfgXlavohrpdafUwL_M/formResponse?entry.305535962=" + SharingManager.sharedInstance.cloudBookkeepingClient +
            "&entry.1848046591=" + SharingManager.sharedInstance.firstName +
             "&entry.1053817752=" + SharingManager.sharedInstance.lastName +
         "&entry.526969259=" + SharingManager.sharedInstance.businessName +
            "&entry.1830506018_day=" + SharingManager.sharedInstance.dateOfBirthDay +
            "&entry.1830506018_month=" + SharingManager.sharedInstance.dateOfBirthMonth +
            "&entry.1830506018_year=" + SharingManager.sharedInstance.dateOfBirthYear +
         "&entry.40993945=" + SharingManager.sharedInstance.residentialAddress +
         "&entry.1699005318=" + SharingManager.sharedInstance.city +
         "&entry.220931772=" + SharingManager.sharedInstance.state +
         "&entry.1511034802=" + SharingManager.sharedInstance.postcode +
         "&entry.1157536828=" + SharingManager.sharedInstance.BASPeriod +
         "&entry.1222593284=" + SharingManager.sharedInstance.ABN +
         "&entry.719071380=" + SharingManager.sharedInstance.TFN +
        "&entry.2124799098=" + SharingManager.sharedInstance.refundFromATO +
        "&entry.1616077229=" + SharingManager.sharedInstance.BSBNumber +
        "&entry.1379182776=" + SharingManager.sharedInstance.bankAccountNumber +
        "&entry.480367925=" + SharingManager.sharedInstance.bankAccountName +
        "&entry.221947356=" + SharingManager.sharedInstance.grossFares +
        "&entry.854893634=" + SharingManager.sharedInstance.tolls +
        "&entry.1773887307=" + SharingManager.sharedInstance.misc +
        "&entry.853980785=" + SharingManager.sharedInstance.otherIncome +
        "&entry.1222003851=" + SharingManager.sharedInstance.detailsOfOtherIncome +
           "&entry.1223010405=" + SharingManager.sharedInstance.haveYouKeptLogbook +
           "&entry.61720861=" + SharingManager.sharedInstance.logbookPercentage +
           "&entry.2065554579=" + SharingManager.sharedInstance.uberUsePercentage +
           "&entry.875276628=" + SharingManager.sharedInstance.fuel +
           "&entry.1370939415=" + SharingManager.sharedInstance.insurance +
           "&entry.2104943261=" + SharingManager.sharedInstance.registration +
             "&entry.449118661=" + SharingManager.sharedInstance.repAndMaint +
         "&entry.221122234=" + SharingManager.sharedInstance.cleaning +
         "&entry.427560732=" + SharingManager.sharedInstance.didYouPurchase +
         "&entry.1976809337=" + SharingManager.sharedInstance.purchaseOrSale +
         "&entry.1360019636=" + SharingManager.sharedInstance.makeAndModel +
         "&entry.152351604=" + SharingManager.sharedInstance.purchasePrice +
             "&entry.1502227971=" + SharingManager.sharedInstance.salePrice +
            "&entry.422488942_day=" + SharingManager.sharedInstance.psDateDay +
            "&entry.422488942_month=" + SharingManager.sharedInstance.psDateMonth +
            "&entry.422488942_year=" + SharingManager.sharedInstance.psDateYear +
            
         "&entry.172170058=" + SharingManager.sharedInstance.mobilePhoneBills +
            "&entry.997683223=" + SharingManager.sharedInstance.percOfPhoneForUber +
        "&entry.1186702389=" + SharingManager.sharedInstance.accBook +
        "&entry.1663564460=" + SharingManager.sharedInstance.fpl +
        "&entry.746235210=" + SharingManager.sharedInstance.parking +
             "&entry.380323467=" + SharingManager.sharedInstance.riderSup +
             "&entry.1745492218=" + SharingManager.sharedInstance.stationaryAndOffice +
             "&entry.1380261086=" + SharingManager.sharedInstance.tollsOther +
             "&entry.202447478=" + SharingManager.sharedInstance.otherExp +
            "&entry.1355699792=" + SharingManager.sharedInstance.informationAboutOtherExp +
            "&pageHistory=" + SharingManager.sharedInstance.pageHistory +
            "&submit=Submit"
        
        //let url = NSURL(string: urlString)
        
        /* 3. Configure the request */
         let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        /* 4. Make the request */
        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
            
            if let error = downloadError {
                print("Could not complete the request \(error)")
            } else {
                
            }
        }
        
        /* 7. Start the request */
        task.resume()

        
    }
    
}
