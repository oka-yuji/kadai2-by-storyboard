//
//  ViewController.swift
//  Kadai2BySB
//
//  Created by 岡優志 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextFieldOne: UITextField!
    @IBOutlet weak var inputTextFieldTwo: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let numAraay: [UITextField] = [inputTextFieldOne, inputTextFieldTwo]
        
        for item in numAraay {
            item.keyboardType = UIKeyboardType.numberPad
        }
    }

    @IBAction func resultButton(_ sender: UIButton) {
        let numAraay = [inputTextFieldOne, inputTextFieldTwo]
            .map({ Int($0?.text ?? "") ?? 0 })
        
        switch (segmentedControl.selectedSegmentIndex, numAraay[1]) {
        case (0,_):
            resultLabel.text = String(numAraay[0] + numAraay[1])
        case (1,_):
            resultLabel.text = String(numAraay[0] - numAraay[1])
        case (2,_):
            resultLabel.text = String(numAraay[0] * numAraay[1])
        case (3,0):
            resultLabel.text = "0"
        case (3,_):
            resultLabel.text = String(numAraay[0] / numAraay[1])
        default:
            resultLabel.text = "error"
        }
    }
}

