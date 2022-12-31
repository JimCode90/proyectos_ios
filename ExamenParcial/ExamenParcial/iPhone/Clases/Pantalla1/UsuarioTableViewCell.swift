//
//  UsuarioTableViewCell.swift
//  ExamenParcial
//
//  Created by user213492 on 10/20/22.
//

import UIKit

class UsuarioTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lblUsuario: UILabel!
    
    func loadData(nombre: String){
        self.lblUsuario.text = nombre
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
