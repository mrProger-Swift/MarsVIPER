//
//  ServiceContainer.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.

import Swinject
import Foundation
 class ServiceContainer {
  public  var container = Container()
    static var shared = ServiceContainer()
    
    init(
        network : NetworkManagerProtocol = NetworkManager.shared
    ) {
        container.register(NetworkManagerProtocol.self) { _ in NetworkManager.shared };
        container.register(ParseManagerProtocol.self) { _ in ParseManager() }
        container.register(CoreDataManagerProtocol.self) { _ in CoreDatamanager()}
    }
    
    
    func resolve<Protocol>( _protocol: Protocol.Type) -> Protocol? {
        container.resolve(_protocol)
    }
    
}
