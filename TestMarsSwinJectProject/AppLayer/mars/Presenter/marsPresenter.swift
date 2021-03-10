//
//  marsPresenter.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 05/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import UIKit

final class marsPresenter: marsPresenterFromViewProtocol {
    
    // MARK: - Public Properties
    
    weak var view: marsViewProtocol!
    var interactor: marsInteractorProtocol!
    var router: marsRouterProtocol!
    var dManager = DeletedManager()
    var firstLoad =  true
    var photo = [Photo]()
    var parseDataManager: ParseManagerProtocol{
        ServiceContainer.shared.resolve(_protocol: ParseManagerProtocol.self)!
    }
    var coreDataManager: CoreDataManagerProtocol{
        ServiceContainer.shared.resolve(_protocol: CoreDataManagerProtocol.self)!
    }
    // MARK: - Protocol Implementation
    
    func viewDidLoad() {
        loadData()
    }
    
    func loadData() {
        let user = UserDefaults.standard
        user.bool(forKey: Constants.firstLaunchKey)
        if user.bool(forKey: Constants.firstLaunchKey){
            coreDataManager.getPhoto {[weak self] photo in
                guard let self = self else {return}
                self.photo = filtredPhotos(photoArray: photo)
                self.view.reloadData()
            }
        } else {
            parseDataManager.parseData(params: Constants.paramsMarsPhoto,
                                       url: Constants.url,
                                       responceModel: MarsResponceModel.self){ [weak self](error) in
                let alert =  AlertManager().getAlert(title: L10n.error,
                                                     message: error.localizedDescription,
                                                     alertTextField: false,
                                                     secondAlertTextField: false) { (_, _) in}
                    complessionLat: { (_) in}
                    complession: { }
                                        self?.view.presentMarsAlert(alert: alert)
            } complession: { [weak self]photos in
                guard let self = self else {return}
                self.photo = self.filtredPhotos(photoArray: photos.photos)
                self.coreDataManager.saveData(photo: photos.photos)
                self.view.reloadData()
                user.set(true, forKey: Constants.firstLaunchKey)
            }
            
        }
    }
    
    func filtredPhotos(photoArray: [Photo])-> [Photo]{
        let filter = DeletedManager().arrayOfDeletedIds()
        let filteredPhotos = photoArray.filter{ !filter.contains($0.id) }
        return filteredPhotos
    }
    
    func ignoredPhotos(id: Int){
        dManager.addToIgnore(id: id)
        loadData()
        view.reloadData()
    }
}

// MARK: - marsPresenterFromInteractorProtocol Implementation
extension marsPresenter: marsPresenterFromInteractorProtocol {}
