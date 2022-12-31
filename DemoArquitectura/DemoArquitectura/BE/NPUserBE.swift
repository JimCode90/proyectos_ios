//
//  NPUserBE.swift
//  NuevoProyecto
//
//  Created by Gabriel Castillo Vizcarra on 7/10/22.
//

import UIKit

class NPUserBE: NSObject {

    var name: String
    var lastName: String
    var mail: String
    var age: Int
    
    init(name: String, lastName: String, mail: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.mail = mail
        self.age = age
    }
}
