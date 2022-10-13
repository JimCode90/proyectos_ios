//
//  UsuarioTableViewCell.swift
//  Formularios
//
//  Created by user213492 on 9/30/22.
//

import UIKit

class UsuarioTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblNombre: UILabel!
    
    
    func loadData(nombre : String){
        lblNombre.text = nombre
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
