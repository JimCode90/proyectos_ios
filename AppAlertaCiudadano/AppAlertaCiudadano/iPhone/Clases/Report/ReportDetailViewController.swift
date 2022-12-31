//
//  ReportDetailViewController.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/11/22.
//

import UIKit

class ReportDetailViewController: UIViewController {
    
    var arraySedes : [SedeBE] = []

    @IBOutlet weak var tblvSedes: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getSedes()
    }
    
    private func getSedes(){
        SedeBL.getSedes { sedes in
            self.arraySedes = sedes.listOfSedes
            self.tblvSedes.reloadData()
            print(self.arraySedes)
        }
    }
    
}

extension ReportDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySedes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ReportDetailTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ReportDetailTableViewCell
        cell.loadData(sede: arraySedes[indexPath.row])
        return cell
    }
    
    
    
}
