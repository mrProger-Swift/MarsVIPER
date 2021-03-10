//
//  EarthConfigurator.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 07/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Swinject
import UIKit

final class EarthConfigurator: NSObject, Assembly {

    // MARK: - Public Properties
    public var container: Container!

    func assemble(container: Container) {
        self.container = container
        configure(container: container)
    }
    
    private func configure(container: Container) {

        // Assembly View Layer
        container
            .register(EarthViewProtocol.self) { _ in EarthViewController() }
            .initCompleted { r, c in
                guard let view = c as? EarthViewController else { return }
                view.presenter = r.resolve(EarthPresenterProtocol.self)
            }

        // Assembly Router Layer
        container
            .register(EarthRouterProtocol.self) { _ in EarthRouter() }
            .initCompleted { _, c in
                guard let router = c as? EarthRouter else { return }
                router.configurator = self
            }

        // Assembly Presenter Layer
        container
            .register(EarthPresenterProtocol.self) { _ in EarthPresenter() }
            .initCompleted { r, c in
                guard let presenter = c as? EarthPresenter else { return }
                presenter.view = r.resolve(EarthViewProtocol.self)
                presenter.router = r.resolve(EarthRouterProtocol.self)
                presenter.interactor = r.resolve(EarthInteractorProtocol.self)
            }

        // Assembly Interactor Layer
        container
            .register(EarthInteractorProtocol.self) { _ in EarthInteractor() }
            .initCompleted { r, c in
                guard let interactor = c as? EarthInteractor else { return }
                interactor.presenter = r.resolve(EarthPresenterProtocol.self)
            }
    }
}

// MARK: - ConfiguratorView
extension EarthConfigurator: ConfiguratorView {
    func getView() -> UIViewController {
        container.resolveAsViewController(EarthViewProtocol.self)
    }
}
