//
//  marsPresenterProtocol.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 05/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Foundation

protocol marsPresenterFromViewProtocol: class {
    var photo : [Photo] {get set}
    func viewDidLoad()
    func loadData()
    func ignoredPhotos(id: Int)
}

protocol marsPresenterFromInteractorProtocol: class {}

typealias marsPresenterProtocol 
    = marsPresenterFromViewProtocol & marsPresenterFromInteractorProtocol
