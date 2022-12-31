//
//  ReportCreateViewController.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/11/22.
//

import UIKit
import DropDown

protocol ReportCreateViewControllerDelegate {
    func agregarReporte(reporte: ReportBE)
}

class ReportCreateViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var activeField : UITextField?
    
    var delegate : ReportCreateViewControllerDelegate?
    
    @IBOutlet weak var checkboxArma: UIButton!
    @IBOutlet weak var checkboxTipoArma1: UIButton!
    @IBOutlet weak var checkboxTipoArma2: UIButton!
    @IBOutlet weak var checkboxTipoArma3: UIButton!
    
    
    @IBOutlet weak var txfAsunto: UITextField!
    @IBOutlet weak var txfTipoArmaOtros: UITextField!
    @IBOutlet weak var txfDescripcion: UITextField!
    @IBOutlet weak var txfPersonas: UITextField!
    
    @IBOutlet weak var factorDropDownView: UIView!
    @IBOutlet weak var factorDropdownButton: UIButton!
    

    let factorDropdown = DropDown()
    let factorValuesArray = ["Factor 01", "Factor 02", "Factor 03", "Factor 04"]
    
    @IBAction func isTappedFactorDropdownButton(_ sender: Any) {
        
        factorDropdown.show()
        
    }
    
    @IBOutlet weak var factorLabel: UILabel!
    
    var estadoArma: Bool? = nil
    var tipoArma: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        factorDropdown.anchorView = factorDropDownView
        factorDropdown.dataSource = factorValuesArray
        factorDropdown.bottomOffset = CGPoint(x: 0, y: (factorDropdown.anchorView?.plainView.bounds.height)!)
        factorDropdown.topOffset = CGPoint(x:0, y: -(factorDropdown.anchorView?.plainView.bounds.height)!)
        factorDropdown.direction = .bottom
        
        factorDropdown.selectionAction = {
            (index: Int, item: String) in
            self.factorLabel.text = self.factorValuesArray[index]
            self.factorLabel.textColor = .black
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
    
    
    @IBAction func checkboxBtnArmas(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            estadoArma = false
        } else {
            sender.isSelected = true
            estadoArma = true
        }
    
    }
    
    @IBAction func checkboxBtnTipoArma1(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            tipoArma = ""
        } else {
            sender.isSelected = true
            tipoArma = "Arma Blanca"
        }
    }
    
    @IBAction func checkboxBtnTipoArma2(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            tipoArma = ""
        } else {
            sender.isSelected = true
            tipoArma = "Arma de Fuego"
        }
    }
    
    @IBAction func checkboxBtnTipoArma3(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            tipoArma = ""
        
        } else {
            sender.isSelected = true
            tipoArma = txfTipoArmaOtros.text ?? ""
        }
    }
    
    
    @IBAction func actionAgregarReporte(_ sender: Any) {
        
        let reporte = ReportBE(id: UUID(), asunto: txfAsunto.text ?? "", factor: factorLabel.text ?? "", personas: Int(txfPersonas.text ?? "0") ?? 0, armas: estadoArma ?? false, tipoArma: tipoArma, descripcion: txfDescripcion.text ?? "")
        
        ReportBL.agregarReporte(reporte: reporte) {
            self.delegate?.agregarReporte(reporte: reporte)
            self.navigationController?.popViewController(animated: true)
        }
        
        self.mostrarNotificacion()
    }
    
    private func mostrarNotificacion(){
 
        let center = UNUserNotificationCenter.current()
        let contenido = UNMutableNotificationContent()
        contenido.title = "Felicitaciones"
        contenido.body = "Acabas de registrar tu reporte de manera correcta"
        contenido.categoryIdentifier = "com.ISIL.AppAlertaCiudadano"
        let fireDate = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute,.second], from: Date().addingTimeInterval(20))
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest.init(identifier: "notificacionPrueba", content: contenido, trigger: trigger)
                    center.add(request){
                        error in print("enviado")
                    }
    }
        
}

extension ReportCreateViewController: UITextFieldDelegate {
    
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
