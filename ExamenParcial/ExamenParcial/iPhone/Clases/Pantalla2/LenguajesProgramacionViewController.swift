//
//  LenguajesProgramacionViewController.swift
//  ExamenParcial
//
//  Created by user213492 on 10/20/22.
//

import UIKit

class LenguajesProgramacionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var clvLenguajes: UICollectionView!
    
    var arrayLenguajes : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayLenguajes.append("JavaScript")
        arrayLenguajes.append("Python")
        arrayLenguajes.append("Swift")
        arrayLenguajes.append("Java")
        arrayLenguajes.append("PHP")
        arrayLenguajes.append("C#")
        
        self.clvLenguajes.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayLenguajes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "LenguajeCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! LenguajeCollectionViewCell
        cell.loadData(descripcion: arrayLenguajes[indexPath.row])
        return cell
    }
    

  

}
