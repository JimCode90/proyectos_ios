//
//  LoginViewController.swift
//  Formularios
//
//  Created by user213492 on 9/30/22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtApellidoPaterno: UITextField!
    
    
    @IBOutlet weak var txtApellidoMaterno: UITextField!
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.txtNombre{
            return self.txtApellidoPaterno.becomeFirstResponder() //hace focus al siguiente TextField
        } else{
            self.actionIniciar(nil)
            return textField.resignFirstResponder() //desaparece el teclado
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if self.txtNombre == textField{
            print(textField.text!)
            print(string)

            let total = (textField.text?.count ?? 0) + string.count

            if total > 8 {
                return false
            }
            return true
        }else{
            return true
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
   
    
    @IBAction func actionIniciar(_ sender: Any?) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
