//
//  PlanetasViewController.swift
//  Parcial
//
//  Created by user213492 on 10/21/22.
//

import UIKit

class PlanetasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var clvPlanetas: UICollectionView!
    var arrPlanetas : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrPlanetas.append("Mercurio")
        arrPlanetas.append("Neptuno")
        arrPlanetas.append("Saturno")
        arrPlanetas.append("Marte")
        arrPlanetas.append("Tierra")
        arrPlanetas.append("Venus")
        
        self.clvPlanetas.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrPlanetas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "PlanetaCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PlanetaCollectionViewCell
        
        cell.cargarDatos(nombre: arrPlanetas[indexPath.row])
        
        return cell
    }
    

   
}
