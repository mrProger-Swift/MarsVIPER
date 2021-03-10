//
//  ResponceModel.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//

import Foundation
// MARK: - MarsResponceModel
struct MarsResponceModel: Codable {
    let photos: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id: Int
    let imgSrc: String

enum CodingKeys: String, CodingKey {
    case id
    case imgSrc = "img_src"
}
}

// MARK: - EarthResponceModel
struct EarthResponceModel: Codable {
    let date, id: String
    let resource: Resource
    let serviceVersion: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date, id, resource
        case serviceVersion = "service_version"
        case url
    }
}

// MARK: - Resource
struct Resource: Codable {
    let dataset, planet: String
}
