//
//  SedeBL.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/16/22.
//

import UIKit

class SedeBL: NSObject {
    class func getSedes(completion: @escaping (_ sedes: SedesBE) -> Void){
        SedesWS.getSedes(completion: completion)
    }
}
