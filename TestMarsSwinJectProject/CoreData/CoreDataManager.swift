//
//  CoreDataManager.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//

import CoreData
import UIKit

protocol CoreDataManagerProtocol {
    func saveData(photo: [Photo])
    func getPhoto(complession: ([Photo])->())
}

class CoreDatamanager: CoreDataManagerProtocol {
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData(photo: [Photo]){
        DispatchQueue.main.async { [self] in
            for item in photo {
                let save = CDPhotos(entity: CDPhotos.entity(), insertInto: context)
                save.id = Int64(item.id)
                save.imgSrc = item.imgSrc
                appDelegate.saveContext()
            }
        }
    }
    
    func getPhoto(complession: ([Photo])->()) {
        var photo = [Photo]()
        var photos = [CDPhotos]()
        do{
            photos = try context.fetch(CDPhotos.fetchRequest())
            for item in photos{
                let convPhoto = Photo(id: Int(Int64(item.id )), imgSrc: item.imgSrc ?? "")
                photo.append(convPhoto)
                complession(photo)
            }
        } catch {
        }
    }
}
