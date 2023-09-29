//
//  LatestLaunches.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

// MARK: - LatestLaunchesModel
struct LatestLaunchesModel: Codable {
    var links: Links?
    var rocket: String?
    var crew: [String]?
    var capsules: [String]?
    var payloads: [String]?
    var launchPad: String?
    var flightNumber: Int?
    var name: String?
    var dateUtc: String?
    var dateUnix: Int?
    var dateLocal: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case links, rocket, crew, capsules, payloads, name, id
        case launchPad = "launchpad"
        case flightNumber = "flight_number"
        case dateUtc = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
    }
}

// MARK: - Core
struct Core: Codable {
    var core: String?
    var flight: Int?
    var gridfins, legs, reused, landingAttempt: Bool?
    var landingSuccess: Bool?
    var landingType, landpad: String?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}

// MARK: - Links
struct Links: Codable {
    var patch: Patch?
    var reddit: Reddit?
    var flickr: Flickr?
    var webcast: String?
    var youtubeID: String?
    var wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, webcast
        case youtubeID = "youtube_id"
        case wikipedia
    }
}

// MARK: - Flickr
struct Flickr: Codable {
    var small, original: [String]?
}

// MARK: - Patch
struct Patch: Codable {
    var small, large: String?
}

// MARK: - Reddit
struct Reddit: Codable {
    var launch: String?
}
