//
//  LatestLaunch.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 2.10.2023.
//

import Foundation

protocol LatestLaunchManagerProtocol {
    var latestLaunch: LatestLaunchesModel? { get set }
}

class LatestLaunchManager: LatestLaunchManagerProtocol {
    
    static let shared = LatestLaunchManager()
    private init() { }
    
    var latestLaunch: LatestLaunchesModel? {
        get {
            return UserDefaultsManager.get(forKey: "latestLaunch")
        }
        set(latestLaunchModel) {
            UserDefaultsManager.set(latestLaunchModel, forKey: "latestLaunch")
//            LiveActivityManager.shared.stopActivity()
            LiveActivityManager.shared.startActivity(endDate: latestLaunchModel?.dateUtc)
        }
    }
}
