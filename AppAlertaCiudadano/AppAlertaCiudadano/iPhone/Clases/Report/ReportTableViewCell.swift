//
//  ReportTableViewCell.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/11/22.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblAsunto: UILabel!
    
    @IBOutlet weak var lblDescripcion: UILabel!
    
    func loadData (reporte: Reporte) {
        self.lblAsunto.text = reporte.asunto
        self.lblDescripcion.text = reporte.descripcion
    }

}
