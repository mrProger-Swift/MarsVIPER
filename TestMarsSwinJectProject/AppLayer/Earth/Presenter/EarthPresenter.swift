//
//  EarthPresenter.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 07/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import Foundation

final class EarthPresenter: EarthPresenterFromViewProtocol {
    
    // MARK: - Public Properties
    
    weak var view: EarthViewProtocol!
    var interactor: EarthInteractorProtocol!
    var router: EarthRouterProtocol!
    var photoArray = [EarthResponceModel]()
    var parseDataManager: ParseManagerProtocol{
        ServiceContainer.shared.resolve(_protocol: ParseManagerProtocol.self)!}
    var coreDataManager: CoreDataManagerProtocol{
        ServiceContainer.shared.resolve(_protocol: CoreDataManagerProtocol.self)!}
    // MARK: - Protocol Implementation
    
    func viewDidLoad() {
    }
    
    func loadData(lat: Float, lon: Float ){
        let params = ["lat": lat,
                      "lon": lon,
                      "dim": 0.3,
                      "api_key": Constants.api_key] as [String: Any]
        parseDataManager.parseData(params: params,
                                   url: Constants.urlEarth,
                                   responceModel: EarthResponceModel.self) { [weak self](error) in
            let alert = AlertManager().getAlert(title: L10n.error,
                                                message: error.localizedDescription,
                                                alertTextField: false,
                                                secondAlertTextField: false) { (_, _) in}
                                                complessionLat: { (_) in}
                                                complession: {}
                                    self?.view.present(alert: alert)
        } complession: { (responce) in
            self.photoArray.append(responce)
            self.view.reloadData()
        }
        
    }
}

// MARK: - EarthPresenterFromInteractorProtocol Implementation
extension EarthPresenter: EarthPresenterFromInteractorProtocol {}
