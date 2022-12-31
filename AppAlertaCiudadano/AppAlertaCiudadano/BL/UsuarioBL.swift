//
//  UsuarioBL.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/8/22.
//

import UIKit

class UsuarioBL: NSObject {
    
    class func agregarUsuario(usuario: UsuarioBE, completion: () -> Void){
        if usuario.nombres == "" {
            print("El nombre es requerido")
        } else if usuario.apellidos == ""{
            print("El apellido es requerido")
        } else if usuario.dni == "" {
            print("El dni es requerido")
        }else if usuario.celular == "" {
            print("El celular es requerido")
        }else if usuario.email == "" {
            print("El email es requerido")
        }else if usuario.password == "" {
            print("El password es requerido")
        } else if usuario.password != usuario.repeat_password {
            print("Los password no son iguales")
        }else {
            //Agreamos al usuario
            UsuarioDA.save(usuario: usuario)
            completion()
        }
    }
    
    class func getData() -> [Usuario]? {
        return UsuarioDA.getData()
    }
}
