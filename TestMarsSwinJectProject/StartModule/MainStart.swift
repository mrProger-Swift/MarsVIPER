//
//  MainStart.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//
protocol MainProtocol {
    func start()
}


import Foundation
class MainStart: MainProtocol{
    
    func start() {
        Coordinator.shared.display(confViews: MainModuleConfigurator())
    }
}

