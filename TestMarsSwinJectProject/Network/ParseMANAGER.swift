//
//  ParseManager.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//

import Foundation

protocol ParseManagerProtocol{
func parseData<T: Codable>(params: [String: Any], url: String, responceModel: T.Type,
                           errorComplession: @escaping(Error)->(), complession: @escaping (T) -> ())
}

class ParseManager: ParseManagerProtocol{
  
    
    var networkManager: NetworkManagerProtocol{
        ServiceContainer.shared.resolve(_protocol: NetworkManagerProtocol.self)!
    }
    
    
    func parseData<T: Codable>(params: [String: Any], url: String,
                               responceModel: T.Type,
                               errorComplession: @escaping(Error)->(),
                               complession: @escaping (T) -> ()) {
        networkManager.getData(params: params, url: url) { (responce) in
                        guard let data = responce.data else {return}
                        do{
                        let decoded = try JSONDecoder().decode(responceModel.self, from: data)
                            complession(decoded)
                        } catch {
                            let error = error as Error
                            errorComplession(error)
                            
                        }
    }
    }
}
