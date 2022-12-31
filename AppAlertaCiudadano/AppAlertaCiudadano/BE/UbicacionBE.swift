//
//  UbicacionBE.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/16/22.
//

import UIKit

class UbicacionBE: NSObject {
    var id: UUID
    var id_reporte: UUID
    var latitud: Double
    var longitud: Double
        
    init(id: UUID, id_reporte: UUID, latitud: Double, longitud: Double){
        self.id = id
        self.id_reporte = id_reporte
        self.latitud = latitud
        self.longitud = longitud
    }
}
