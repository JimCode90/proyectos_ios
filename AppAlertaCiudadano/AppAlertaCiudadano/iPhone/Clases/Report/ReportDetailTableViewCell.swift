//
//  ReportDetailTableViewCell.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/16/22.
//

import UIKit

class ReportDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lnlNombre: UILabel!
    
    @IBOutlet weak var lblLongitud: UILabel!
    @IBOutlet weak var lblLatitud: UILabel!
    
    func loadData(sede: SedeBE){
        lnlNombre.text = sede.sede
        lblLatitud.text = sede.ubicacion.latitud
        lblLongitud.text = sede.ubicacion.longitud
    }

}
