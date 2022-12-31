//
//  ViewController.swift
//  Parcial
//
//  Created by user213492 on 10/21/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var tv1: UITextField!
    @IBOutlet weak var tv2: UITextField!
    @IBOutlet weak var tv3: UITextField!
    @IBOutlet weak var tv4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.tv1 == textField {
            self.tv2.becomeFirstResponder()
        }else if self.tv2 == textField {
            self.tv3.becomeFirstResponder()
        }else if self.tv3 == textField{
            self.tv4.becomeFirstResponder()
        }else {
            textField.resignFirstResponder()
        }
        return true
    }


}

