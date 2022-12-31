//
//  ReportBL.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/12/22.
//

import UIKit

class ReportBL: NSObject {
    
    class func agregarReporte(reporte: ReportBE, completion: () -> Void){
        if reporte.asunto == "" {
            print("Asunto es requerido")
        }else if reporte.descripcion == "" {
            print("Descripcion es requerido")
        }else {
            //agregamos la pelicula
            ReportDA.save(reporte: reporte)
            completion()
        }
    }
    
    class func getData() -> [Reporte]? {
        
        return ReportDA.getData()
    }
    
    class func deleteReporte(reporte: Reporte, completion: () -> Void){
        ReportDA.deleteReporte(reporte: reporte)
    }

}
