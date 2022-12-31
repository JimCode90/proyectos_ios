//
//  TablaCarrosViewController.swift
//  Parcial
//
//  Created by user213492 on 10/21/22.
//

import UIKit

class TablaCarrosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tblvCarros: UITableView!
    var arrCarros : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrCarros.append("Audi A6")
        arrCarros.append("KIA Grand Carnival")
        arrCarros.append("Suzuki Celerio")
        arrCarros.append("Subaru Legacy")
        arrCarros.append("SsangYong Tivoli")
        arrCarros.append("Ford Fusion")
        tblvCarros.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrCarros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CarroTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CarroTableViewCell
        cell.cargarDatos(nombre: arrCarros[indexPath.row])
        return cell
    }
    



}
