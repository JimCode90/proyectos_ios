//
//  TablaUsuarioViewController.swift
//  ExamenParcial
//
//  Created by user213492 on 10/20/22.
//

import UIKit

class TablaUsuarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tblvUsuario: UITableView!
    
    var arrayUsuarios : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayUsuarios.append("Jesus Anglas Ayme")
        arrayUsuarios.append("Paul Quispe Salazar")
        arrayUsuarios.append("Jorge Mendoza Villavicencio")
        arrayUsuarios.append("Lesly Gonzales Chavez")
        arrayUsuarios.append("Diana Gutierrez Palomino")
        tblvUsuario.reloadData()

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUsuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "UsuarioTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UsuarioTableViewCell
        cell.loadData(nombre: arrayUsuarios[indexPath.row])
        return cell
    }

}
