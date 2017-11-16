//
//  ViewController.swift
//  CurrentcyBitcoinConverter
//
//  Created by practica on 1/11/17.
//  Copyright © 2017 practica. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var currentPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPickerView.delegate=self
        currentPickerView.dataSource=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    let currencyArray=["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB"]
    let baseURL="https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    var finalURL:String?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currencyArray[row])
        finalURL = baseURL+currencyArray[row];
        getBitcoinData(url: finalURL!)
    }
    //MARK: - Networking
    
    func getBitcoinData(url:String){
        Alamofire.request(url,method: .get).responseJSON { (response) in
            if response.result.isSuccess{
                let bitcoinJSON:JSON = JSON(response.result.value!)
                self.updateBitcoinData(json: bitcoinJSON)
            }else{print("Error:\(response.result.error)")
                self.labelPrice.text="Se presento un problema en la conexion"}
        }
    }
    func updateBitcoinData(json:JSON){
    
        if let bitcoinResult=json["ask"].double{
            labelPrice.text=String(bitcoinResult)
        }else{
            print("Servicio no disponible")
        }
    }
    
}

