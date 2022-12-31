//
//  PlanetaCollectionViewCell.swift
//  Parcial
//
//  Created by user213492 on 10/21/22.
//

import UIKit

class PlanetaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblNombrePlaneta: UILabel!
    
    func cargarDatos(nombre: String){
        self.lblNombrePlaneta.text = nombre
    }
}
