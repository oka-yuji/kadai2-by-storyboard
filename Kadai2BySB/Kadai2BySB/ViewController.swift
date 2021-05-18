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
       
    }
    

}

