//
//  NPLoginViewController.swift
//  NuevoProyecto
//
//  Created by Gabriel Castillo Vizcarra on 7/10/22.
//

import UIKit

class NPLoginViewController: UIViewController {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionLogIn(_ sender: Any) {
        
        if NPUserBL.validateLogIn(user: txtUser.text, password: txtPassword.text) {
            
        } else {
            let alert = UIAlertController(title: "Alerta", message: "Faltan datos", preferredStyle: .alert)
            let acceptButton = UIAlertAction(title: "Aceptar", style: .destructive) { _ in
                print("Presionó aceptar")
            }
            let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
                print("Presionó cancelar")
            }
            alert.addAction(acceptButton)
            alert.addAction(cancelButton)
            self.present(alert, animated: true)
        }
    }
    
    private func servicePostLogIn() {
        //StartLoading
        NPUserBL.postLogIn()
        //Stop Loading
        
    }
    

}
