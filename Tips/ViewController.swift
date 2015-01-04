//
//  ViewController.swift
//  Tips
//
//  Created by Anuj Verma on 1/3/15.
//  Copyright (c) 2015 Anuj Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalQuarterLabel: UILabel!
    @IBOutlet weak var totalThirdLabel: UILabel!
    @IBOutlet weak var totalHalfLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var fadeView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.tipLabel.alpha = 0
//        self.totalLabel.alpha = 0
        self.fadeView.alpha = 0
        self.billField.frame = CGRect(x: 202, y: 115, width: 150, height: 92)
        self.tipControl.alpha = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        if (billField.text.isEmpty) {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.fadeView.alpha = 0
                self.billField.frame = CGRect(x: 202, y: 115, width: 150, height: 92)
                self.fadeView.alpha = 0
                self.tipControl.alpha = 0
                
            })
            
        } else {
        
        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var halfTotal = total / 2
        var thirdTotal = total / 3
        var quarterTotal = total / 4
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        totalHalfLabel.text = "$\(halfTotal)"
        totalThirdLabel.text = "$\(thirdTotal)"
        totalQuarterLabel.text = "$\(quarterTotal)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalHalfLabel.text = String(format: "$%.2f", halfTotal)
        totalThirdLabel.text = String(format: "$%.2f", thirdTotal)
        totalQuarterLabel.text = String(format: "$%.2f", quarterTotal)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
//            self.tipLabel.alpha = 1
//            self.totalLabel.alpha = 1
            self.fadeView.alpha = 1
            self.billField.frame = CGRect(x: 202, y: 38, width: 150, height: 92)
            self.tipControl.alpha = 1
        })
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

