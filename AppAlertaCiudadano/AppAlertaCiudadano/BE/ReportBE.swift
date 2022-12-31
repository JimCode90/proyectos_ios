//
//  ReportBE.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/11/22.
//

import UIKit

class ReportBE: NSObject {
    
    var id: UUID
    var asunto : String
    var factor : String
    var personas : Int
    var armas : Bool
    var tipoArma: String
    var descripcion : String
    
    init(id: UUID, asunto: String, factor: String, personas: Int, armas: Bool, tipoArma: String, descripcion: String) {
        self.id = id
        self.asunto = asunto
        self.factor = factor
        self.personas = personas
        self.armas = armas
        self.tipoArma = tipoArma
        self.descripcion = descripcion
    }

}
