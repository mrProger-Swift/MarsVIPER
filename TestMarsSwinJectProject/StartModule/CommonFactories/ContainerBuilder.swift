//
//  ContainerBuilder.swift
//  QRDynamic
//
//  Created by Aleksandr Khlebnikov on 03.07.2020.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation
import Swinject

/// Строитель наполнения контейнера
final class ContainerBuilder {
    
    // MARK: - Private Properties
    private var container: Container!
    
    // MARK: - Lifecycle
    
    init() {
        self.container = Container(defaultObjectScope: .container)
        container.register(MainProtocol.self) { _ in MainStart() }
    }
    
    // MARK: - Building
    
    @discardableResult
    func addAlerts() -> ContainerBuilder {
        return self
    }
    
    @discardableResult
    func addServices() -> ContainerBuilder {
        

        container.register(marsViewProtocol.self) { _ in
            marsViewController()
        }
        return self
    }
    
    @discardableResult
    func addAnalytics() -> ContainerBuilder {
        self
    }
    
    @discardableResult
    func addLogging() -> ContainerBuilder {
        return self
    }
    
    func build() -> Container {
        self.container
    }
    
}
