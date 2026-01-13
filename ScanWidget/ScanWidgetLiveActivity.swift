//
//  ScanWidgetLiveActivity.swift
//  ScanWidget
//
//  Created by m1 on 13/01/2026.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ScanWidgetAttributes: ActivityAttributes {
    var name: String
    public struct ContentState: Codable, Hashable {
        var message: String
    }
}

struct ScanWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ScanWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text(context.state.message)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

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
                    Text(context.state.message)
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text(context.state.message)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ScanWidgetAttributes {
    fileprivate static var preview: ScanWidgetAttributes {
        ScanWidgetAttributes(name: "World")
    }
}

extension ScanWidgetAttributes.ContentState {
    fileprivate static var smiley: ScanWidgetAttributes.ContentState {
        ScanWidgetAttributes.ContentState(message: "😀")
     }
     
     fileprivate static var starEyes: ScanWidgetAttributes.ContentState {
         ScanWidgetAttributes.ContentState(message: "🤩")
     }
}

#Preview("Notification", as: .content, using: ScanWidgetAttributes.preview) {
   ScanWidgetLiveActivity()
} contentStates: {
    ScanWidgetAttributes.ContentState.smiley
    ScanWidgetAttributes.ContentState.starEyes
}
