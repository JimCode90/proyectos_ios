//
//  SedeBE.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/16/22.
//

import UIKit
import Alamofire

class SedesBE: Codable {
    let listOfSedes: [SedeBE]
    enum CodingKeys: String, CodingKey {
        case listOfSedes = "data"
    }
}

struct SedeBE: Codable {
    var codigo      : String
    var sede        : String
    var telefono    : String
    var ubicacion   : UbicacionClass
    enum CodingKeys: String, CodingKey {
        case codigo
        case sede
        case telefono
        case ubicacion
       
    }
}

struct UbicacionClass: Codable{
    var direccion   : String
    var latitud     : String
    var longitud    : String
    enum CodingKeys: String, CodingKey{
        case direccion
        case latitud
        case longitud
    }
}
