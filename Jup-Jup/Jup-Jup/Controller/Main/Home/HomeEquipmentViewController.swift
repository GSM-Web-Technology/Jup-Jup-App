//
//  HomeEquipmentViewController.swift
//  Jup-Jup
//
//  Created by 조주혁 on 2021/01/08.
//

import UIKit
import Alamofire

var titleName = String()
var content = String()
var count = Int()

class HomeEquipmentViewController: UIViewController {

//    @IBOutlet weak var titleLabel: UILabel! {
//        didSet {
//            titleLabel.text = titleName
//        }
//    }
//    @IBOutlet weak var contentLabel: UILabel! {
//        didSet {
//            contentLabel.text = content
//        }
//    }
    @IBOutlet weak var equipmentCount: UILabel! {
        didSet {
            equipmentCount.text = "수량: \(count)개"
        }
    }
    @IBOutlet weak var doneButton: UIButton! {
        didSet {
            doneButton.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var stepper: UIStepper! {
        didSet {
            stepper.minimumValue = 1
            stepper.maximumValue = Double(count)
        }
    }
    @IBOutlet weak var reasonTextView: UITextView! {
        didSet {
            reasonTextView.layer.cornerRadius = 5
            reasonTextView.delegate = self
        }
    }
    @IBOutlet weak var rentalCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleName
    }
    
    @IBAction func countStepper(_ sender: UIStepper) {
        rentalCount.text = "대여 수량: \(Int(sender.value))개"
    }
    
    @IBAction func doneBtn(_ sender: UIButton) {
        sucessAlert()
    }
    
    func sucessAlert() {
        let alert = UIAlertController(title: "대여 성공", message: "대여 성공!!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func failAlert() {
        let alert = UIAlertController(title: "대여 실패", message: "대여 실패!!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

extension HomeEquipmentViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
