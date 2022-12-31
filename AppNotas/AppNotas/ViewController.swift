//
//  ViewController.swift
//  AppNotas
//
//  Created by user213492 on 10/15/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate  {
  

    @IBOutlet weak var tabla: UITableView!
    var categorias = [Categorias]()
    var fetchResultController : NSFetchedResultsController<Categorias>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        mostrarCategorias()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let categoria = categorias[indexPath.row]
        cell.textLabel?.text=categoria.nombre
        return cell
    }
    
    // MARK: GUARDAR EN ALERTA
    
    
    @IBAction func guardar(_ sender: UIBarButtonItem) {
        let alerta = UIAlertController(title: "Nueva Categoria", message: "Ingresa un nombre para la categoria", preferredStyle: .alert)
        alerta.addTextField { (nombre) in
            nombre.placeholder = "Nombre de categoria"
        }
        
        let aceptar = UIAlertAction(title: "Aceptar", style: .default) { (action) in
            guard let nombre = alerta.textFields?.first?.text else {
                return
            }
            
            let contexto = Conexion().contexto()
            let entityCategorias = NSEntityDescription.insertNewObject(forEntityName: "Categorias", into: contexto) as! Categorias
            
            entityCategorias.id = UUID()
            entityCategorias.nombre = nombre
             
            do {
                try contexto.save()
                print("Guardo")
            } catch let error as NSError {
                print("no se guardo", error.localizedDescription)
            }
            
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alerta.addAction(aceptar)
        alerta.addAction(cancelar)
        present(alerta, animated: true, completion: nil)
        
        
        
    }
    
    // MARK: FETCHRESULTCONTROLLER
    func mostrarCategorias(){
        let contexto = Conexion().contexto()
        let fetchRequest : NSFetchRequest<Categorias> = Categorias.fetchRequest()
        // SELECT nombre FROM categorias ORDER BY nombre DESC
        let orderByNombre = NSSortDescriptor(key: "nombre", ascending: true)
        fetchRequest.sortDescriptors = [orderByNombre]
        
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchResultController.delegate = self
        
        do {
            try fetchResultController.performFetch()
            categorias = fetchResultController.fetchedObjects!
        } catch let error as NSError {
            print("Hubo un error", error.localizedDescription)
        }
        
        
    }
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tabla.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tabla.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            self.tabla.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            self.tabla.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            self.tabla.reloadRows(at: [indexPath!], with: .fade)
        default:
            self.tabla.reloadData()
        }
        
        self.categorias = controller.fetchedObjects as! [Categorias]
    }
    
    
    
    
    
    
    


}

