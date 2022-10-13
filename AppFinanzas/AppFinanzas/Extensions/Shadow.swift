//
//  Shadow.swift
//  AppFinanzas
//
//  Created by user213492 on 10/11/22.
//

import UIKit

extension UIView {
    var borderUIColor: UIColor{
        get {
            guard let color = layer.borderColor else {
                return UIColor.black
            }
            
            return UIColor(cgColor: color)
        }
        
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
