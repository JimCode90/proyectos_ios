//
//  SssViewController.swift
//  Navegacion
//
//  Created by user213492 on 10/8/22.
//

import UIKit

class SssViewController: UIViewController {

    @IBOutlet weak var resultado: UILabel!
    
    var recibirTexto:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultado.text = recibirTexto
    }
    

    @IBAction func regresar(_ sender: UIButton) {
        //de esta manera regresamos desde el navigation bar, con nuestri propio boton
        navigationController?.popViewController(animated: true)
    }
    
}
