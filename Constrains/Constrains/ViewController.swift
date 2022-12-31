//
//  ViewController.swift
//  Constrains
//
//  Created by user213492 on 10/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottonConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var descuento: UILabel!
    
    
    @IBOutlet weak var txCantidad: UITextField!
    
    @IBOutlet weak var txPorcentaje: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pantalla()
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        

    }
    func pantalla(){
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height{
            case 1136:
                print("Iphone 5 o SE")
            case 1334:
                print("IPhone 6, 6S, 7, 8")
                print("Cualquier otro tamaño")
                self.bottonConstraint.constant = 200
            case 1920:
                print("IPhone Plus")
            case 2036:
                print("IPhone 10, XS")
                self.bottonConstraint.constant = 280
            case 1792:
                print("IPhone XR")
            case 2436:
                print("IPhone XS MAX")
                self.bottonConstraint.constant = 280
            default:
                print("Cualquier otro tamaño")
                self.bottonConstraint.constant = 280
            }
        }
    }
    
    @objc func teclado(notificacion: Notification){
        guard let tecladoUp = (notificacion.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notificacion.name == UIResponder.keyboardWillShowNotification {
            if UIScreen.main.nativeBounds.height == 1136 {
                self.view.frame.origin.y = -tecladoUp.height
            }
        } else {
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func calcular(_ sender: UIButton) {
        if txCantidad.text != "" && txPorcentaje.text != "" {
            self.view.endEditing(true)
            guard let numero = txCantidad.text else {
                return
            }
            guard let porc = txPorcentaje.text else {
                return
            }
            
            let cant = (numero as NSString).floatValue
            let porciento = (porc as NSString).floatValue
            
            let desc = cant * porciento / 100
            
            let totalFinal = cant - desc
            
            total.text = "S/. \(totalFinal)"
            descuento.text = "S/. \(desc)"
        } else {
            let alert = UIAlertController(title: "Alerta", message: "Escribe una cantidad y porcentaje", preferredStyle: .alert)
            let accion = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(accion)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    @IBAction func limpiar(_ sender: Any) {
        self.view.endEditing(true)
        
        total.text = "S/. 0.00"
        descuento.text = "S/. 0.00"
        txCantidad.text = ""
        txPorcentaje.text = ""
    }
    
}

