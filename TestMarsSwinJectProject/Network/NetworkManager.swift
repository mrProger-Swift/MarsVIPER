//
//  NetworkManager.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//
import Foundation
import Alamofire

protocol  NetworkManagerProtocol {
    func getData(params: [String: Any], url: String, complession: @escaping(AFDataResponse<Any>)->() )
    
}

final class NetworkManager: NetworkManagerProtocol{
    
    static  var shared = NetworkManager()
    
  
    
    func getData(params: [String: Any], url: String, complession: @escaping(AFDataResponse<Any>)->() ){
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: .none, interceptor: .none, requestModifier: .none).responseJSON { (responce) in
            complession(responce)
        }
    }
    private init(){}
}
