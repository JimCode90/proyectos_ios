//
//  ViewController.swift
//  ExamenParcial
//
//  Created by user213492 on 10/20/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    @IBOutlet weak var TextField3: UITextField!
    @IBOutlet weak var TextField4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.TextField1 == textField {
            self.TextField2.becomeFirstResponder()
        }else if self.TextField2 == textField{
            self.TextField3.becomeFirstResponder()
        }else if self.TextField3 == textField{
            self.TextField4.becomeFirstResponder()
        }else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }

}

