//
//  AppDelegate.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//

import UIKit
import CoreData
import Swinject
var globalContainer: Container!
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var mains: MainProtocol!{
        globalContainer.resolve(MainProtocol.self)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        conteinerRegister()
        mains.start()
        return true
    }

    func conteinerRegister() {
        globalContainer = FactoryConrainers.factoryRootContainer(with: [.alerts, .analitycs, .logging, .services])
    }
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TestMarsSwinJectProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

