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
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            resultLabel.text = String(numAraay[0] + numAraay[1])
        case 1:
            resultLabel.text = String(numAraay[0] - numAraay[1])
        case 2:
            resultLabel.text = String(numAraay[0] * numAraay[1])
        case 3 where numAraay[1] == 0:
            resultLabel.text = "0"
        case 3:
            resultLabel.text = String(numAraay[0] / numAraay[1])
        default:
            resultLabel.text = "error"
        }
    }
}

private enum Operator {
    enum Error: Swift.Error {
        case divisionByZero
    }

    case addition
    case subtraction
    case multiplication
    case division
    
    init?(selectedSegmentIndex: Int) {
        switch selectedSegmentIndex {
        case 0: self = .addition
        case 1: self = .subtraction
        case 2: self = .multiplication
        case 3: self = .division
        default: return nil
        }
    }
    
    func calculate(ope:Operator, num1:Int, num2:Int) -> Result<Int, Error> {
        func apply(_ ope: (Int,Int) -> Int) -> Result<Int, Error> {
            .success(ope(num1, num2))
        }
        switch ope {
               case .addition:
                   return apply(+)
               case .subtraction:
                   return apply(-)
               case .multiplication:
                   return apply(*)
               case .division where num1 == 0:
                return .failure(.divisionByZero)
               case .division:
                   return apply(/)
               }
    }
}
