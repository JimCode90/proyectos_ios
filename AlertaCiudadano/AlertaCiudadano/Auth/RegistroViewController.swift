//
//  RegistroViewController.swift
//  AlertaCiudadano
//
//  Created by user213492 on 10/7/22.
//

import UIKit

class RegistroViewController: UIViewController {
    
    
    @IBOutlet weak var inputNombresDataView: UIView!
    @IBOutlet weak var inputDniDataView: UIView!
    @IBOutlet weak var inputFechaEmisionDataView: UIView!
    @IBOutlet weak var inputCelularDataView: UIView!
    @IBOutlet weak var inputEmailDataView: UIView!
    @IBOutlet weak var inputPassDataView: UIView!
    @IBOutlet weak var inputConfirmPassDataView: UIView!
    
    private let colorGray = UIColor(red: 216/255, green: 211/255, blue: 211/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        inputNombresDataView.layer.borderColor = colorGray.cgColor
        inputNombresDataView.layer.borderWidth = 1
        inputNombresDataView.layer.cornerRadius = 10
        inputNombresDataView.clipsToBounds = true
        
        inputDniDataView.layer.borderColor = colorGray.cgColor
        inputDniDataView.layer.borderWidth = 1
        inputDniDataView.layer.cornerRadius = 10
        inputDniDataView.clipsToBounds = true
        
        inputFechaEmisionDataView.layer.borderColor = colorGray.cgColor
        inputFechaEmisionDataView.layer.borderWidth = 1
        inputFechaEmisionDataView.layer.cornerRadius = 10
        inputFechaEmisionDataView.clipsToBounds = true
        
        inputCelularDataView.layer.borderColor = colorGray.cgColor
        inputCelularDataView.layer.borderWidth = 1
        inputCelularDataView.layer.cornerRadius = 10
        inputCelularDataView.clipsToBounds = true
        
        inputEmailDataView.layer.borderColor = colorGray.cgColor
        inputEmailDataView.layer.borderWidth = 1
        inputEmailDataView.layer.cornerRadius = 10
        inputEmailDataView.clipsToBounds = true
        
        inputPassDataView.layer.borderColor = colorGray.cgColor
        inputPassDataView.layer.borderWidth = 1
        inputPassDataView.layer.cornerRadius = 10
        inputPassDataView.clipsToBounds = true
        
        inputConfirmPassDataView.layer.borderColor = colorGray.cgColor
        inputConfirmPassDataView.layer.borderWidth = 1
        inputConfirmPassDataView.layer.cornerRadius = 10
        inputConfirmPassDataView.clipsToBounds = true
        
        
        
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
