//
//  AlertManager.swift
//  TestMarsSwinJectProject
//
//  Created by User on 06.03.2021.
//

import UIKit
class AlertManager{
    
    func getAlert(title: String, message: String,
                  alertTextField: Bool,
                  secondAlertTextField: Bool,
                  complessionLan: @escaping(Float, Float)->(),
                  complessionLat: @escaping(String)->(),
                  complession: @escaping()->() ) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if alertTextField{ alert.addTextField { (textField) in
            textField.placeholder = "enter longitude, example 60.0 " }}
        if secondAlertTextField{ alert.addTextField { (textField) in
            textField.placeholder = "enter latitude, example 100.0"}}
        let action = UIAlertAction(title: "OK", style: .default) {  _ in
            complession()
            if alertTextField{
            let firstElement = alert.textFields![0]
            let secondElement = alert.textFields![1]
            if let longitude = Float(firstElement.text!), let latitude = Float(secondElement.text!){
                complessionLan (longitude, latitude)
            }
            }
        }
            
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
     
        alert.addAction(action)
        alert.addAction(cancel)
        return alert
        
    }
    
    
}



//func getAlert(title: String, message: String, complession: @escaping()->() ) -> UIAlertController{
//    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    let action = UIAlertAction(title: "OK", style: .default) {  _ in
//        complession()}
//    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//    alert.addAction(action)
//    alert.addAction(cancel)
//    return alert
//}
