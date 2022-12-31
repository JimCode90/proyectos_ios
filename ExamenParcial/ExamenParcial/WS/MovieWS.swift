//
//  MovieWS.swift
//  ExamenParcial
//
//  Created by user213492 on 10/28/22.
//

import UIKit
import Alamofire

class MovieWS: NSObject {
    class func getMovies(completion: @escaping (_ movie: MoviesBE)-> Void){
        
        let urlString = ""
        let url = URL(string: urlString)
        AF.request(url, method: .get).response { response in
            switch response.result {
            case .success(let data) :
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let movies = try decoder.decode(MoviesBE.self, from: data)
                    completion(movies)
                }catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
