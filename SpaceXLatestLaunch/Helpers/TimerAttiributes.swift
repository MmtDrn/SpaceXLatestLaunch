//
//  TimerAttiributes.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 3.10.2023.
//

import Foundation
import ActivityKit

struct TimerAttiributes: ActivityAttributes {
    public typealias TimerStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var endTime: Date
    }
    var timerName: String
}
