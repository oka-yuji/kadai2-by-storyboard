//
//  ViewController.swift
//  Kadai2BySB
//
//  Created by 岡優志 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var inputTextFieldOne: UITextField!
    @IBOutlet private weak var inputTextFieldTwo: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    //TextFieldに入力したものを配列に入れる
    private var textAraay: [UITextField] {[inputTextFieldOne, inputTextFieldTwo]}
    override func viewDidLoad() {
        super.viewDidLoad()
       //配列にあるTextFieldに対してナンバー入力のキーボードが起動する
        for item in textAraay {
            item.keyboardType = .numberPad
        }
    }
      //計算処理のメソッド
    @IBAction func resultButton(_ sender: UIButton) {
        //配列にあるString？型を一括してInt型に変換
        let numAraay = textAraay.map({ Int($0.text ?? "") ?? 0 })
        /**
         Index番号によって計算式を変更する。 case(3,0)に関してはTextFieldTwoに0が入るとエラーになるので必ずcase(3,_)より手前で処理
         defaultにはエラー処理
         */
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

