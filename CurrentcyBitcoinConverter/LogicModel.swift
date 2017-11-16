//
//  LogicModel.swift
//  CurrentcyBitcoinConverter
//
//  Created by practica on 15/11/17.
//  Copyright © 2017 practica. All rights reserved.
//

import Foundation
struct LogicModel  {

   let currencyArray=["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SBD","MRO","MNT"]
    let symbolArray=["$","R$","$","¥","€","£","$","Rp","₪","INR","¥","$","kr","$","zł","lei","Br","$","","₮"]
    
    func countArrayCurrency() -> Int {
        return currencyArray.count
    }
    func nameArrayCurrency(row:Int) -> String {
        return currencyArray[row]
    }
    func nameArraySymbol(row:Int) -> String {
        return symbolArray[row]
    }
    func FormatNumber(number:Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.groupingSeparator = "."
        let returnValue = numberFormatter.string(from: NSNumber(value:number))
        
        return returnValue!
    }
    
    

}
