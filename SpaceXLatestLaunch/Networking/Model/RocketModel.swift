//
//  RocketModel.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

// MARK: - RocketModel
struct RocketModel: Codable {
    var height: HeightModel?
    var diameter: DiameterModel?
    var mass: MassModel?
    var flickrImages: [String]?
    var name: String?
    var type: String?
    var active: Bool?
    var firstFlight: String?
    var country: String?
    var company: String?
    var wikipedia: String?
    var description: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case height, diameter, mass, name, type, active
        case flickrImages = "flickr_images"
        case firstFlight = "first_flight"
        case country, company, wikipedia, description, id
    }
}

struct HeightModel: Codable {
    var meters: Double?
    var feet: Double?
}

struct DiameterModel: Codable {
    var meters: Double?
    var feet: Double?
}

struct MassModel: Codable {
    var kg: Double?
    var lb: Double?
}
