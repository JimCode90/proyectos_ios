//
//  UbicacionDA.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/16/22.
//

import UIKit
import CoreData

class UbicacionDA: NSObject {
    class func save(ubicacion: UbicacionBE){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContect = appDelegate.persistentContainer.viewContext
                
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "Ubicacion", into: managedContect) as? Ubicacion else {return}
          
        entity.id = ubicacion.id
        entity.id_reporte = ubicacion.id_reporte
        entity.latitud = ubicacion.latitud
        entity.longitud = ubicacion.longitud
        
        appDelegate.saveContext()
        
    }
}
