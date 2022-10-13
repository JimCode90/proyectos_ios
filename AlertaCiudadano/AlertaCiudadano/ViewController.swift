//
//  ViewController.swift
//  AlertaCiudadano
//
//  Created by user213492 on 10/6/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var inputUserDataView: UIView!
    @IBOutlet weak var inputPassDataView: UIView!
    
    private let colorGray = UIColor(red: 216/255, green: 211/255, blue: 211/255, alpha: 1)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //Codigo para cargar todas las fuentes
        inputUserDataView.layer.borderColor = colorGray.cgColor
        inputUserDataView.layer.borderWidth = 1
        inputUserDataView.layer.cornerRadius = 10
        inputUserDataView.clipsToBounds = true
        
        inputPassDataView.layer.borderColor = colorGray.cgColor
        inputPassDataView.layer.borderWidth = 1
        inputPassDataView.layer.cornerRadius = 10
        inputPassDataView.clipsToBounds = true
        
        
    }


}

