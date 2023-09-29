//
//  CapsuleModel.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

struct CapsuleModel: Codable {
    var reuseCount: Int?
    var serial: String?
    var status: String?
    var type: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case reuseCount = "reuse_count"
        case serial, status, type, id
    }
}
