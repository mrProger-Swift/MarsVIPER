//
//  MainModulePresenter.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 08/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Foundation

final class MainModulePresenter: MainModulePresenterFromViewProtocol {

    // MARK: - Public Properties

    weak var view: MainModuleViewProtocol!
    var interactor: MainModuleInteractorProtocol!
    var router: MainModuleRouterProtocol!

    // MARK: - Protocol Implementation

    func viewDidLoad() {
    }
}

// MARK: - MainModulePresenterFromInteractorProtocol Implementation
extension MainModulePresenter: MainModulePresenterFromInteractorProtocol {}
