//
//  PssViewController.swift
//  Navegacion
//
//  Created by user213492 on 10/7/22.
//

import UIKit

class PssViewController: UIViewController {

    @IBOutlet weak var texto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func regresar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enviar(_ sender: UIButton) {
        performSegue(withIdentifier: "enviar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            let destino = segue.destination as! SssViewController
            destino.recibirTexto = texto.text
        }
    }
}
