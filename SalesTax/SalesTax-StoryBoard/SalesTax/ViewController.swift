//
//  ViewController.swift
//  SalesTax
//
//  Created by Karoly Nyisztor on 5/24/21.
//

import UIKit

class ViewController: UIViewController {

    var beforeTaxPrice: Float = 0.0;
    var salesTaxRate: Float = 0.0;
    var afterTaxPrice: Float = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var afterTaxPriceTextField: UITextField!
    
    @IBAction func beforeTaxPriceChange(_ sender: UITextField) {
        if let value = Float(sender.text!) {
            beforeTaxPrice = value
            NSLog("beforeTaxPriceChange \(value)")
        } else {
            beforeTaxPrice = 0
        }
    }
    
    @IBAction func salesTaxRateChanged(_ sender: UITextField) {
        if let value = Float(sender.text!) {
            salesTaxRate = value
            NSLog("salesTaxRateChanged \(value)")
        } else {
            salesTaxRate = 0
        }
    }
    
    @IBAction func calculateOnClicked(_ sender: UIButton) {
        let taxAmount = beforeTaxPrice * salesTaxRate / 100
        let totalPrice = beforeTaxPrice + taxAmount
        
        afterTaxPriceTextField.text = String(totalPrice)
        
    }
}

