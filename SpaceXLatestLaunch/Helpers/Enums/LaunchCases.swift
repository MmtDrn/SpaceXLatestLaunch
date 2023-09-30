//
//  LaunchCases.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

enum LaunchCases: CaseIterable {
    case main
    case crew
    case rocket
    case capsules
    case launchPad
    
    var title: String? {
        switch self {
        case .main:
            return nil
        case .crew:
            return "Crew"
        case .rocket:
            return "Rocket"
        case .capsules:
            return "Capsule"
        case .launchPad:
            return "Launchpad"
        }
    }
}
