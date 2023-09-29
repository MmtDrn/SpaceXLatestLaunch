//
//  LaunchPadsModel.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

struct LaunchPadsModel: Codable {
    var images: LargeImagesModel?
    var name: String?
    var fullName: String?
    var locality: String?
    var region: String?
    var latitude: Double?
    var longitude: Double?
    var launchAttempts: Int?
    var launchSuccesses: Int?
    var status: String?
    var details: String?
    
    enum CodingKeys: String, CodingKey {
        case images, name
        case fullName = "full_name"
        case locality, region, latitude, longitude
        case launchAttempts = "launch_attempts"
        case launchSuccesses = "launch_successes"
        case status, details
    }

}

struct LargeImagesModel: Codable {
    var large: [String]?
}
