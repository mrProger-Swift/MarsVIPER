//
//  MainModulePresenterProtocol.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 08/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Foundation

protocol MainModulePresenterFromViewProtocol: class {
    func viewDidLoad()
}

protocol MainModulePresenterFromInteractorProtocol: class {}

typealias MainModulePresenterProtocol 
    = MainModulePresenterFromViewProtocol & MainModulePresenterFromInteractorProtocol
