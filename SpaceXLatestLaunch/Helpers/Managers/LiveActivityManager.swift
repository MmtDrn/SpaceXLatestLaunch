//
//  LiveActivityManager.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 3.10.2023.
//

import Foundation
import ActivityKit
import SwiftUI

@available(iOS 16.1, *)
class LiveActivityManager {
    
    static let shared = LiveActivityManager()
    private init() { }
    
    @State var activity: Activity<TimerAttiributes>? = nil
    
    func startActivity(endDate: String? = nil) {
        guard let endDate else { return }
        guard let targetDate = endDate.toDate() else { return }
        
        let attributes = TimerAttiributes(timerName: "Dummy")
        let state = TimerAttiributes.TimerStatus(endTime: Date().addingTimeInterval(24*60*5)) //used dummy date, targetDate is in past tense
        
        activity = try? Activity<TimerAttiributes>.request(attributes: attributes, contentState: state)
    }
    
//    func stopActivity() {
//        let state = TimerAttiributes.TimerStatus(endTime: Date().addingTimeInterval(60*2))
//        Task {
////            let content = ActivityContent(state: state, staleDate: .now)
//            let activityContent = TimerAttiributes.ContentState(endTime: Date().addingTimeInterval(60*2))
//
//            Task {
//                await activity?.end(using: activityContent, dismissalPolicy: .immediate)
//                activity = nil
//            }
//
//        }
//    }
}
