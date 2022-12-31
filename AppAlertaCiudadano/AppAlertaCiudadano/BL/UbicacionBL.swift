//
//  UbicacionBL.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/16/22.
//

import UIKit

class UbicacionBL: NSObject {
    class func agregarUbicacion(ubicacion: UbicacionBE, completion: () -> Void){
        UbicacionDA.save(ubicacion: ubicacion)
        completion()
    }
}
