//
//  Constansts.swift
//  TestMarsSwinJectProject
//
//  Created by User on 06.03.2021.
//

import Foundation
class Constants{
    static var heightForRow = 380
    static var api_key = "lW9zRAa9OLEHobbPppuZDRBqLrYhxD3B32d1VIRe"
    static var url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos"
    static var userKey = "DeletedKey"
    static var firstLaunchKey = "FirstLaunch"
    static var urlEarth = "https://api.nasa.gov/planetary/earth/assets?"
    static var paramsMarsPhoto = ["sol": 1000,
                  "page": 1,
                  "api_key": Constants.api_key] as [String : Any]
   
}

