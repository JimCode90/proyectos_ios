//
//  SedesWS.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/16/22.
//

import UIKit
import Alamofire

class SedesWS: NSObject {
    class func getSedes(completion: @escaping (_ sedes: SedesBE) -> Void){
        
        let urlString = "https://facturaaltoque.pe/api_facturacion_electronica/listar_sedes.php"
                let url = URL(string: urlString)!
                
                AF.request(url, method: .get).response { response in
                    
                    switch response.result {
                        
                    case .success(let data):
                        print("Desde Success Sedes WS")
                        print(data)
                        guard let data = data else { return }
                        do {
                            let decoder = JSONDecoder()
                            let sedes = try decoder.decode(SedesBE.self, from: data)
                            print("Desde success parseado Sedes WS")
                            print(sedes)
                            completion(sedes)
                        } catch let error {
                            print("Desde error Sedes WS")
                            print(error.localizedDescription)
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }

    }
    
}
