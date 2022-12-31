//
//  UsuarioBE.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/8/22.
//

import UIKit

class UsuarioBE: NSObject {
    
    var id : UUID
    var nombres : String
    var apellidos: String
    var dni: String
    var celular: String
    var email: String
    var password: String
    var repeat_password : String
    
    init(id: UUID, nombres: String, apellidos: String, dni: String, celular: String, email: String, password: String, repeat_password: String) {
        self.id = id
        self.nombres = nombres
        self.apellidos = apellidos
        self.dni = dni
        self.celular = celular
        self.email = email
        self.password = password
        self.repeat_password = repeat_password
    }
    
    
}
