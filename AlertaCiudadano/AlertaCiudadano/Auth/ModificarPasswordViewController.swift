//
//  ModificarPasswordViewController.swift
//  AlertaCiudadano
//
//  Created by user213492 on 10/7/22.
//

import UIKit

class ModificarPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var inputPassDataView: UIView!
    @IBOutlet weak var inputConfirmPassDataView: UIView!
    
    private let colorGray = UIColor(red: 216/255, green: 211/255, blue: 211/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputPassDataView.layer.borderColor = colorGray.cgColor
        inputPassDataView.layer.borderWidth = 1
        inputPassDataView.layer.cornerRadius = 10
        inputPassDataView.clipsToBounds = true
        
        inputConfirmPassDataView.layer.borderColor = colorGray.cgColor
        inputConfirmPassDataView.layer.borderWidth = 1
        inputConfirmPassDataView.layer.cornerRadius = 10
        inputConfirmPassDataView.clipsToBounds = true
        // Do any additional setup after loading the view.
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
