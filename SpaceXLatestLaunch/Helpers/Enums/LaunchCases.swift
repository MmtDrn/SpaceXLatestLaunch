//
//  LaunchCases.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import UIKit

enum LaunchCases: CaseIterable {
    case main
    case crew
    case rocket
    case launchPad
    
    var title: String? {
        switch self {
        case .main:
            return nil
        case .crew:
            return "Crew"
        case .rocket:
            return "Rocket"
        case .launchPad:
            return "Launchpad"
        }
    }
    
    var view: UIView? {
        switch self {
        case .main:
            return nil
        case .crew:
            return CrewView()
        case .rocket:
            return RocketView()
        case .launchPad:
            return LaunchpadView()
        }
    }
    
    var contentHeingh: CGFloat {
        switch self {
        case .main:
            return 0
        case .crew:
            return .setPadding(.height(220))
        case .rocket:
            return .setPadding(.height(170))
        case .launchPad:
            return .setPadding(.height(420))
        }
    }
}
