//
//  LockscreenWidgetsBundle.swift
//  LockscreenWidgets
//
//  Created by mehmet duran on 1.10.2023.
//

import WidgetKit
import SwiftUI

@main
struct LockscreenWidgetsBundle: WidgetBundle {
    var body: some Widget {
        LockscreenWidgets()
        LockscreenWidgetsLiveActivity()
    }
}
