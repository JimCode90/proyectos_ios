//
//  ReportDA.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/12/22.
//

import UIKit
import CoreData

class ReportDA: NSObject {
    
    class func save(reporte: ReportBE) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "Reporte", into: managedContext) as? Reporte else { return }
        
        entity.id = reporte.id
        entity.asunto = reporte.asunto
        entity.descripcion = reporte.descripcion
        entity.personas = Int16(reporte.personas)
        entity.armas = reporte.armas
        entity.tipoArma = reporte.tipoArma
        entity.factor = reporte.factor
        
        appDelegate.saveContext()
    }
    
    class func getData() -> [Reporte]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Reporte> = Reporte.fetchRequest()
        do {
            return try managedContext.fetch(fetchRequest)
        }catch {
            print("No se pudo acceder a la BD")
            return nil
        }
    }
    
    class func deleteReporte(reporte: Reporte) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        managedContext.delete(reporte)
        appDelegate.saveContext()
        
    }
    
}
