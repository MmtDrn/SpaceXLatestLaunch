//
//  Routers.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation
import Alamofire

enum Routers: EndpointConfiguration {
    
    case latestLaunches
    case rocket(id: String)
    case crew(id: String)
    case capsules(id: String)
    case payloads(id: String)
    case launchPads(id: String)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .latestLaunches:
            return "launches/latest"
        case .rocket(let id):
            return "rockets/\(id)"
        case .crew(let id):
            return "crew/\(id)"
        case .capsules(let id):
            return "capsules/\(id)"
        case .payloads(let id):
            return "payloads/\(id)"
        case .launchPads(let id):
            return "launchpads/\(id)"
        }
    }
    
    var queryParameters: QueryStringParameters {
        return nil
    }
    
    var httpBody: Data? {
        return nil
    }
    
    var headers: [CustomHTTPHeader]? {
        return nil
    }
    
    
}
