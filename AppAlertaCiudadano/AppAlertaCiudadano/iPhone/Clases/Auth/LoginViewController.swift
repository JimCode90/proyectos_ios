//
//  LoginViewController.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/11/22.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var activeField: UITextField?
    var emailArray = [String]()
    var passwordArray = [String]()
    
    //Contrains
    
    @IBOutlet weak var constraintBtnRight: NSLayoutConstraint!
    @IBOutlet weak var constraintBtnLeft: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.resetAllRecortds(in: "Reporte")
    }
    
    func resetAllRecortds(in entity: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
        }
        catch
        {
            print ("There was an error")
        }
        
    }
    
    
    @IBAction func actionIniciarSesion(_ sender: UIButton) {
       
        //Aninammos el boton de iniciar sesion
        UIView.animate(withDuration: 0.5 ) {
            
            self.constraintBtnRight.constant = 80
            self.constraintBtnLeft.constant = 80
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.constraintBtnRight.constant = 50
            self.constraintBtnLeft.constant = 50
            self.iniciarSesion()
        }
        
        //Fin de la animacion del boton
       
    }
    
    private func iniciarSesion(){
        let arrayUsuarios = UsuarioBL.getData()
        for usuario in arrayUsuarios!{
            if let email = usuario.value(forKey: "email") as? String {
                self.emailArray.append(email)
            }
            if let password = usuario.value(forKey: "password") as? String {
                self.passwordArray.append(password)
            }
        }
        
        if (emailArray.contains(emailText.text!)){
            let emailIndex = emailArray.firstIndex(where: {$0 == emailText.text!})
            
            if passwordArray[emailIndex!] == passwordText.text {
                print("Iniciaste sesion de manera correcta")
                performSegue(withIdentifier: "IrReportesTableSegue", sender: nil)
                self.emailArray = []
                self.passwordArray = []
            }else{
                print("Password incorrecto")
                let alert = UIAlertController(title: "Lo sentimos", message: "Credenciales incorrectas", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
                    UIAlertAction in
                }
                
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                self.emailArray = []
                self.passwordArray = []
            }
        }
      
        else {
            let alert = UIAlertController(title: "Lo sentimos", message: "No existe una cuenta asociada al email ingresado", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
                UIAlertAction in
            }
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            self.emailArray = []
            self.passwordArray = []
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.deregisterFromKeyboardNotifications()
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

extension LoginViewController: UITextFieldDelegate{
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
