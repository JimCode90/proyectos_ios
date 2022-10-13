//
//  TableUsuariosViewController.swift
//  Formularios
//
//  Created by user213492 on 9/30/22.
//

import UIKit

class TableUsuariosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var arrayUsuario : [String] = []
    
    @IBOutlet weak var tlbUsuario: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayUsuario.append("Jorge")
        arrayUsuario.append("Maria")
        arrayUsuario.append("Luis")
        arrayUsuario.append("Marcos")
        
        tlbUsuario.reloadData()


        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUsuario.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "UsuarioTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UsuarioTableViewCell
        
        cell.loadData(nombre: arrayUsuario[indexPath.row])
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

