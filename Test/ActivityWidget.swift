//
//  ActivityWidget.swift
//  Test
//
//  Created by m1 on 13/01/2026.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TestActivityAttributes.self) { context in
            Text(context.state.message)
                .font(.headline)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.message)
                        .font(.headline)
                }
            } compactLeading: {
                Text("T")
            } compactTrailing: {
                Text("t")
            } minimal: {
                Text("T")
            }
        }
    }
}
