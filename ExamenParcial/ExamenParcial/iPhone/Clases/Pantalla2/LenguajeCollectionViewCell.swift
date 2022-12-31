//
//  LenguajeCollectionViewCell.swift
//  ExamenParcial
//
//  Created by user213492 on 10/20/22.
//

import UIKit

class LenguajeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lblDescripcion: UILabel!
    
    func loadData(descripcion: String){
        self.lblDescripcion.text = descripcion
    }
    
    
}
