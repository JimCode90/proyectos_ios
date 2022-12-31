//
//  ReportTableViewController.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 11/11/22.
//

import UIKit
import CoreData

class ReportTableViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tblvReporte: UITableView!
    var arrayReportes : [Reporte]?
    
    var fetchResultController : NSFetchedResultsController<Reporte>!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    
    }
    
    
    @IBAction func btnCrearReporteAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "crearReporte", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getData()
    }
    
    private func getData() {
        self.arrayReportes = ReportBL.getData()
        self.tblvReporte.reloadData()
    }
    
    private func mostrarNotificacion(){
 
        let center = UNUserNotificationCenter.current()
        let contenido = UNMutableNotificationContent()
        contenido.title = "Atención"
        contenido.body = "Acabas de eliminar tu reporte de manera correcta, si en caso no fue usted quien elimino dicho reporte comunicate con nosotros"
        contenido.categoryIdentifier = "com.ISIL.AppAlertaCiudadano"
        let fireDate = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute,.second], from: Date().addingTimeInterval(20))
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest.init(identifier: "notificacionPrueba", content: contenido, trigger: trigger)
                    center.add(request){
                        error in print("enviado")
                    }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "geolocalizar"{
            let id = sender as! NSIndexPath
            let fila = self.arrayReportes?[id.row]
            let destino = segue.destination as! GeolocalizarViewController
            destino.reporte = fila
        }
    }
    
    
}

extension ReportTableViewController: ReportCreateViewControllerDelegate {
    func agregarReporte(reporte: ReportBE) {
        //self.arrayReportes.append(reporte)
        //self.tblvReporte.reloadData()
    }
    
   
}

extension ReportTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayReportes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ReportTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ReportTableViewCell
        
        cell.loadData(reporte: (arrayReportes?[indexPath.row])!)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "verDetalle", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let verDetalle = UITableViewRowAction(style: .destructive, title: "Eliminar"){ (_, indexPath) in
            print("Eliminar")
            let reporte = self.arrayReportes?[indexPath.row]
            ReportBL.deleteReporte(reporte: reporte!) {
                print("Se elimino correctamente")
                
            }
            
            self.mostrarNotificacion()
            
            self.getData()
        }
        let geolocalizar = UITableViewRowAction(style: .normal, title: "Geolocalizar"){ (_, indexPath) in
            print("Geolocalizar")
            self.performSegue(withIdentifier: "geolocalizar", sender: indexPath)
        }
        return [verDetalle, geolocalizar]
    }
    
    
    
}
