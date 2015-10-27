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
//       writeValues()
//        
//        
//        /* 2. Build the URL */
//        
////        rowName != nil ?rowName!.stringFromCamelCase():""
//        
//        let urlString = "https://docs.google.com/forms/d/1wkl4wwmYcWhB_CcVUC3DLACXcfgXlavohrpdafUwL_M/formResponse?entry.305535962=" + SharingManager.sharedInstance.cloudBookkeepingClient +
//            "&entry.1848046591=" + SharingManager.sharedInstance.firstName +
//             "&entry.1053817752=" + SharingManager.sharedInstance.lastName +
//         "&entry.526969259=" + SharingManager.sharedInstance.businessName +
//         "&entry.1830506018=" + SharingManager.sharedInstance.dateOfBirth +
//         "&entry.40993945=" + SharingManager.sharedInstance.residentialAddress +
//         "&entry.1699005318=" + SharingManager.sharedInstance.city +
//         "&entry.220931772=" + SharingManager.sharedInstance.state +
//         "&entry.1511034802=" + SharingManager.sharedInstance.postcode +
//         "&entry.1157536828=" + SharingManager.sharedInstance.BASPeriod +
//         "&entry.1222593284=" + SharingManager.sharedInstance.ABN +
//         "&entry.719071380=" + SharingManager.sharedInstance.TFN +
//        "&entry.2124799098=" + SharingManager.sharedInstance.refundFromATO +
//        "&entry.1616077229=" + SharingManager.sharedInstance.BSBNumber +
//        "&entry.1379182776=" + SharingManager.sharedInstance.bankAccountNumber +
//        "&entry.480367925=" + SharingManager.sharedInstance.bankAccountName +
//        "&entry.221947356=" + SharingManager.sharedInstance.grossFares +
//        "&entry.854893634=" + SharingManager.sharedInstance.tolls +
//        "&entry.1773887307=" + SharingManager.sharedInstance.misc +
//        "&entry.853980785=" + SharingManager.sharedInstance.otherIncome +
//        "&entry.1222003851=" + SharingManager.sharedInstance.detailsOfOtherIncome +
//           "&entry.1223010405=" + SharingManager.sharedInstance.haveYouKeptLogbook +
//           "&entry.61720861=" + SharingManager.sharedInstance.logbookPercentage +
//           "&entry.2065554579=" + SharingManager.sharedInstance.uberUsePercentage +
//           "&entry.875276628=" + SharingManager.sharedInstance.fuel +
//           "&entry.1370939415=" + SharingManager.sharedInstance.insurance +
//           "&entry.2104943261=" + SharingManager.sharedInstance.registration +
//             "&entry.449118661=" + SharingManager.sharedInstance.repAndMaint +
//         "&entry.221122234=" + SharingManager.sharedInstance.cleaning +
//         "&entry.427560732=" + SharingManager.sharedInstance.didYouPurchase +
//         "&entry.1976809337=" + SharingManager.sharedInstance.purchaseOrSale +
//         "&entry.1360019636=" + SharingManager.sharedInstance.makeAndModel +
//         "&entry.152351604=" + SharingManager.sharedInstance.purchasePrice +
//             "&entry.1502227971=" + SharingManager.sharedInstance.salePrice +
//         "&entry.422488942=" + SharingManager.sharedInstance.psDate +
//         "&entry.172170058=" + SharingManager.sharedInstance.mobilePhoneBills +
//            "&entry.997683223=" + SharingManager.sharedInstance.percOfPhoneForUber +
//        "&entry.1186702389=" + SharingManager.sharedInstance.accBook +
//        "&entry.1663564460=" + SharingManager.sharedInstance.fpl +
//        "&entry.746235210=" + SharingManager.sharedInstance.parking +
//             "&entry.380323467=" + SharingManager.sharedInstance.riderSup +
//             "&entry.1745492218=" + SharingManager.sharedInstance.stationaryAndOffice +
//             "&entry.1380261086=" + SharingManager.sharedInstance.tollsOther +
//             "&entry.202447478=" + SharingManager.sharedInstance.otherExp +
//            "&entry.1355699792=" + SharingManager.sharedInstance.informationAboutOtherExp +
//            "&submit=Submit"
//        
//        let url = NSURL(string: urlString)!
//        
//        /* 3. Configure the request */
//        let request = NSMutableURLRequest(URL: url)
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        /* 4. Make the request */
//        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
//            
//            if let error = downloadError {
//                print("Could not complete the request \(error)")
//            } else {
//                
//            }
//        }
//        
//        /* 7. Start the request */
//        task.resume()
//        
//        
//        https://docs.google.com/a/cloudbookkeep.com/forms/d/1wkl4wwmYcWhB_CcVUC3DLACXcfgXlavohrpdafUwL_M/formResponse?entry.305535962=New+Customer&entry.1848046591=test+test&entry.1053817752=test&entry.526969259=test&entry.1830506018=28.08.2015&entry.40993945=ww&entry.1699005318=ww&entry.220931772=Victoria&entry.1511034802=1001&entry.1157536828=Oct+-+Dec+2015&entry.1222593284=55&entry.719071380&entry.2124799098=Yes&entry.1616077229=1&entry.1379182776=1&entry.480367925=1&entry.221947356=1&entry.854893634=1&entry.1773887307=1&entry.853980785=1&entry.1222003851=1&entry.1223010405=Yes&entry.61720861=1&entry.2065554579=1&entry.875276628=1&entry.1370939415=1&entry.2104943261=1&entry.449118661=1&entry.221122234=1&entry.427560732=Yes&entry.1976809337=Purchase&entry.1360019636=1&entry.152351604=1&entry.1502227971&entry.422488942=28/08/2015&entry.172170058=1&entry.997683223=1&entry.1186702389=1&entry.1663564460=1&entry.746235210=1&entry.380323467=1&entry.1745492218=1&entry.1380261086=1&entry.202447478=1&entry.1355699792=1&submit=Submit
//        
//        https://docs.google.com/a/cloudbookkeep.com/forms/d/1pn4CNQ7OwKce4K7ebb_2WZQ6PmFBf-5Qxp8zfdajgSw/formResponse?entry.1748727384=1&entry.1949164265=1&entry.168813548=1441065600&submit=Submit
        
    }
    
  
    

    
    
}
