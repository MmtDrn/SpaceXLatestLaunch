//
//  CrewModel.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

struct CrewModel: Codable {
    var name: String?
    var agency: String?
    var image: String?
    var wikipedia: String?
    var launches: [String]?
    var status: String?
    var id: String?
}
