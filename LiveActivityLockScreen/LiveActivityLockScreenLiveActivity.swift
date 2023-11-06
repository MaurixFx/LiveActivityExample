//
//  LiveActivityLockScreenLiveActivity.swift
//  LiveActivityLockScreen
//
//  Created by Mauricio Figueroa on 05-11-23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivityLockScreenLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MatchActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                MatchScoreView(match: context.attributes.match, scoreText: context.state.scoreText)
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
                    Text("Bottom \(context.state.scoreText)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.scoreText)")
            } minimal: {
                Text(context.state.scoreText)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
