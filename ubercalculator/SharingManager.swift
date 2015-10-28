//
//  SharingManager.swift
//  ubercalculator
//
//  Created by Михаил Валуйский on 27.10.15.
//  Copyright © 2015 Михаил Валуйский. All rights reserved.
//

class SharingManager {
    static let sharedInstance = SharingManager()
    
    // 1st viewController
    var cloudBookkeepingClient : String = ""
    // 2 New Customer Details (Client information)
    var firstName : String = ""
    var lastName : String = ""
    var businessName : String = ""
    var dateOfBirth : String = ""
    var dateOfBirthDay : String = ""
    var dateOfBirthMonth : String = ""
    var dateOfBirthYear : String = ""
    var residentialAddress : String = ""
    var city : String = ""
    var state : String = ""
    var postcode : String = ""
    
    // 3 BasDetailsController (Bas Details)
    var BASPeriod : String = ""
    var ABN : String = ""
    var TFN : String = ""
    var refundFromATO = ""
    
    // 4 BankAccountDetails (Bank Details)
    var BSBNumber = ""
    var bankAccountNumber = ""
    var bankAccountName = ""
    
    // 5 UberIncome Controller (Income)
    var grossFares = ""
    var tolls = ""
    var misc = ""
    var otherIncome = ""
    var detailsOfOtherIncome = ""
    
    // 6 Vehicle Expenses (Uber %)
    var haveYouKeptLogbook = ""
    
    // 7 Logbook
    var logbookPercentage = ""
    
    // 8 No Logbook
    var uberUsePercentage = ""
    
    // Estimate Car expenses
    var fuel = ""
    var insurance = ""
    var registration = ""
    var repAndMaint = ""
    var cleaning = ""
    var didYouPurchase = ""
    
    // 9 Purchase or sale
    var purchaseOrSale = ""
    var makeAndModel = ""
    var purchasePrice = ""
    var salePrice = ""

    var psDateDay = ""
    var psDateMonth = ""
    var psDateYear = ""
    
    // 10 Other expenses
    var mobilePhoneBills = ""
    var percOfPhoneForUber = ""
    var accBook = ""
    var fpl = ""
    var parking = ""
    var riderSup = ""
    var stationaryAndOffice = ""
    var tollsOther = ""
    var otherExp = ""
    var informationAboutOtherExp = ""
    
    
    
    
    
    
    
    
    
    
   
    
}
