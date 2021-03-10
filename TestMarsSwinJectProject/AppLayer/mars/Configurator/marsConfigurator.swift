//
//  marsConfigurator.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 05/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Swinject
import UIKit

final class marsConfigurator: NSObject, Assembly {

    // MARK: - Public Properties
    public var container: Container!

    func assemble(container: Container) {
        self.container = container
        configure(container: container)
    }
    
    private func configure(container: Container) {

        // Assembly View Layer
        container
            .register(marsViewProtocol.self) { _ in marsViewController() }
            .initCompleted { r, c in
                guard let view = c as? marsViewController else { return }
                view.presenter = r.resolve(marsPresenterProtocol.self)
            }

        // Assembly Router Layer
        container
            .register(marsRouterProtocol.self) { _ in marsRouter() }
            .initCompleted { _, c in
                guard let router = c as? marsRouter else { return }
                router.configurator = self
            }

        // Assembly Presenter Layer
        container
            .register(marsPresenterProtocol.self) { _ in marsPresenter() }
            .initCompleted { r, c in
                guard let presenter = c as? marsPresenter else { return }
                presenter.view = r.resolve(marsViewProtocol.self)
                presenter.router = r.resolve(marsRouterProtocol.self)
                presenter.interactor = r.resolve(marsInteractorProtocol.self)
            }

        // Assembly Interactor Layer
        container
            .register(marsInteractorProtocol.self) { _ in marsInteractor() }
            .initCompleted { r, c in
                guard let interactor = c as? marsInteractor else { return }
                interactor.presenter = r.resolve(marsPresenterProtocol.self)
            }
    }
}

// MARK: - ConfiguratorView
extension marsConfigurator: ConfiguratorView {
    func getView() -> UIViewController {
        container.resolveAsViewController(marsViewProtocol.self)
    }
}
