//
//  LockscreenWidgetsLiveActivity.swift
//  LockscreenWidgets
//
//  Created by mehmet duran on 1.10.2023.
//

import WidgetKit
import SwiftUI

@main
@available(iOS 16.1, *)
struct LockscreenWidgetsLiveActivity: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerAttiributes.self) { context in
            // Lock screen/banner UI goes here
            ZStack {
                VStack {
                    Text("Crew 4")
                        .font(.title)
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                    
                    Text(context.state.endTime, style: .timer)
                        .font(.title)
                        .fontWeight(.semibold)
                        .shadow(radius: 5)

                }
            }
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
//            .widgetURL(URL(string: "http://www.apple.com"))
//            .keylineTint(Color.red)
        }
    }
}
