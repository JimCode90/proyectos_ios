//
//  Conexion.swift
//  AppNotas
//
//  Created by user213492 on 10/15/22.
//

import Foundation
import CoreData
import UIKit

class Conexion {
    func contexto() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
}
