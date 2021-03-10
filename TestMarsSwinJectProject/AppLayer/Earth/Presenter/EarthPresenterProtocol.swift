//
//  EarthPresenterProtocol.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 07/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Foundation

protocol EarthPresenterFromViewProtocol: class {
    var photoArray : [EarthResponceModel] {get set}
    func viewDidLoad()
    func loadData(lat: Float, lon: Float )
    
}

protocol EarthPresenterFromInteractorProtocol: class {}

typealias EarthPresenterProtocol 
    = EarthPresenterFromViewProtocol & EarthPresenterFromInteractorProtocol
