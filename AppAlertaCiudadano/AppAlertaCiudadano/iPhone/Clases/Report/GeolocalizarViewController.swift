//
//  GeolocalizarViewController.swift
//  AppAlertaCiudadano
//
//  Created by user213492 on 12/15/22.
//

import UIKit
import MapKit
import CoreLocation

protocol GeolocalizarViewControllerDelegate {
    func agregarUbicacion(ubicacion: UbicacionBE)
}

class GeolocalizarViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate {

    	
    @IBOutlet weak var buscador: UISearchBar!
    
    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var txtLat: UITextField!
    @IBOutlet weak var txtLng: UITextField!
    
    @IBOutlet weak var nombreReporteText: UINavigationBar!
    
    var manager = CLLocationManager()
    var latitud: CLLocationDegrees!
    var longitud: CLLocationDegrees!
    
    var reporte : Reporte!
    
    var delegate: GeolocalizarViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreReporteText.topItem?.title = reporte.asunto
        buscador.delegate = self
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
    }
    
    
    @IBAction func guardarUbicacionAction(_ sender: UIButton) {
        
        if self.txtLat.text == "" {
            print("La latitud es requerida")
        } else if self.txtLng.text == "" {
            print("La longitud es requerido")
        } else {
            
            let ubicacion = UbicacionBE(id: UUID(), id_reporte: reporte.id!, latitud: Double(txtLat.text!) ?? 0.0, longitud: Double(txtLng.text!) ?? 0.0)
            
            UbicacionBL.agregarUbicacion(ubicacion: ubicacion) {
                self.delegate?.agregarUbicacion(ubicacion: ubicacion)
                self.limpiarCampos()
                print("Registro Exitoso de ubicacion")
                
                let alert = UIAlertController(title: "Felicitaciones!", message: "La ubicación se ha registrado exitosamente", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
                    UIAlertAction in
                }
                                
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
                self.mostrarNotificacion()
                
            }
        }
        
    }
    
    private func mostrarNotificacion(){
 
        let center = UNUserNotificationCenter.current()
        let contenido = UNMutableNotificationContent()
        contenido.title = "Felicitaciones"
        contenido.body = "Acabas de asociar la ubicacion del reporte de manera correcta"
        contenido.categoryIdentifier = "com.ISIL.AppAlertaCiudadano"
        let fireDate = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute,.second], from: Date().addingTimeInterval(20))
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest.init(identifier: "notificacionPrueba", content: contenido, trigger: trigger)
                    center.add(request){
                        error in print("enviado")
                    }
    }
    
    func limpiarCampos(){
        txtLng.text = ""
        txtLat.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        buscador.resignFirstResponder()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(buscador.text!) { (places:[CLPlacemark]?, error:Error?) in
            if error == nil {
                        
                let place = places?.first
                let anotacion = MKPointAnnotation()
                anotacion.coordinate = (place?.location?.coordinate)!
                anotacion.title = self.buscador.text
                print(anotacion.coordinate.latitude)
                let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                let region = MKCoordinateRegion(center: anotacion.coordinate, span: span)
                self.mapa.setRegion(region, animated: true)
                self.mapa.addAnnotation(anotacion)
                self.mapa.selectAnnotation(anotacion, animated: true)
                
                self.txtLng.text = String(anotacion.coordinate.longitude)
                self.txtLat.text = String(anotacion.coordinate.latitude)
                        
            }else{
                print("error al encontrar direccion")
                }
            }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.latitud = location.coordinate.latitude
            self.longitud = location.coordinate.longitude
        }
    }

    @IBAction func obtenerCoordenadas(_ sender: Any) {
        txtLat.text = String(latitud!)
        txtLng.text = String(longitud!)
        let localizacion = CLLocationCoordinate2DMake(latitud, longitud)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: localizacion, span: span)
        mapa.setRegion(region, animated: true)
        mapa.showsUserLocation = true    }
}
