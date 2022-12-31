//
//  NPUserBL.swift
//  NuevoProyecto
//
//  Created by Gabriel Castillo Vizcarra on 7/10/22.
//

import UIKit

class NPUserBL: NSObject {

    class func validateLogIn(user: String?, password: String?) -> Bool {
        
        if user?.count == 0 {
            print("Falta user")
            return false
        }
        
        if password?.count == 0 {
            print("Falta password")
            return false
        }
        
        print("Inició sesión")
        return true
        
    }
    
    class func postLogIn() {
        NPUserWS.postLogIn()
        //Implemento logica
    }
    
}
