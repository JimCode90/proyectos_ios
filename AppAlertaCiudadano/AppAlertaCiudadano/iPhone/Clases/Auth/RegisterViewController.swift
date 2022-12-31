//
//  RegisterViewController.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/11/22.
//

import UIKit

protocol RegisterViewControllerDelegate {
    func agregarUsuario(usuario: UsuarioBE)
}



class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nombres: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    
    @IBOutlet weak var dni: UITextField!
    @IBOutlet weak var celular: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeat_password: UITextField!

    @IBOutlet weak var scrollView: UIScrollView!
    
    var activeField : UITextField?
    var delegate: RegisterViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func guardarUsuario(_ sender: UIButton) {
        let usuario = UsuarioBE(id: UUID(), nombres: nombres.text ?? "", apellidos: apellidos.text ?? "", dni: dni.text ?? "", celular: celular.text ?? "", email: email.text ?? "", password: password.text ?? "", repeat_password: repeat_password.text ?? "")
        //print(email.text)
        UsuarioBL.agregarUsuario(usuario: usuario){
            self.delegate?.agregarUsuario(usuario: usuario)
            self.limpiarCamposRegistro()
            print("Registro Exitoso")
        }
        
        let alert = UIAlertController(title: "Felicitaciones!", message: "Te has registrado exitosamente", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
            UIAlertAction in
        }
                        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func limpiarCamposRegistro(){
        nombres.text = ""
        apellidos.text = ""
        dni.text = ""
        celular.text = ""
        email.text = ""
        password.text = ""
        repeat_password.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.deregisterFromKeyboardNotifications()
    }
    

    @IBAction func btnReturnLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func registerForKeyboardNotifications(){
           //Adding notifies on keyboard appearing
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       
       func deregisterFromKeyboardNotifications(){
           //Removing notifies on keyboard appearing
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       
       @objc func keyboardWasShown(notification: NSNotification){
           //Need to calculate keyboard exact size due to Apple suggestions
           self.scrollView.isScrollEnabled = true
           let info = notification.userInfo!
           let keyboardSize = (info [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
           let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize!.height, right: 0.0)
           
           self.scrollView.contentInset = contentInsets
           self.scrollView.scrollIndicatorInsets = contentInsets
           
           var aRect : CGRect = self.view.frame
           aRect.size.height -= keyboardSize!.height
           if let activeField = self.activeField {
               if (!aRect.contains(activeField.frame.origin)){
                   self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
               }
           }
       }
       
       @objc func keyboardWillBeHidden(notification: NSNotification){
           //Once keyboard disappears, restore original positions
           let info = notification.userInfo!
           let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
           let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyboardSize!.height, right: 0.0)
           self.scrollView.contentInset = UIEdgeInsets.zero
           self.scrollView.scrollIndicatorInsets = contentInsets
           self.view.endEditing(true)
       }

}


extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
    }
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
