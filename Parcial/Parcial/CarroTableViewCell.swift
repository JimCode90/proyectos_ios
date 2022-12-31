//
//  CarroTableViewCell.swift
//  Parcial
//
//  Created by user213492 on 10/21/22.
//

import UIKit

class CarroTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblNombreCarro: UILabel!
    
    func cargarDatos(nombre: String){
        self.lblNombreCarro.text = nombre
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
