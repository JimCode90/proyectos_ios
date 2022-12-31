//
//  UsuarioDA.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/8/22.
//

import UIKit
import CoreData

class UsuarioDA: NSObject {
    class func save(usuario: UsuarioBE) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContect = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: managedContect) as? Usuario else {return}
        
        entity.id = usuario.id
        entity.nombres = usuario.nombres
        entity.apellidos = usuario.apellidos
        entity.email = usuario.email
        entity.dni = usuario.dni
        entity.celular = usuario.celular
        entity.password = usuario.password
        
        appDelegate.saveContext()
    }
    
    class func getData() -> [Usuario]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Usuario> = Usuario.fetchRequest()
        
        do {
             return try managedContext.fetch(fetchRequest)
         }catch {
             print("No se pudo acceder a la BD")
             return nil
         }
        
    }
}
