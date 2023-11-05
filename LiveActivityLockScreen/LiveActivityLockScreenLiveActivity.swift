//
//  LiveActivityLockScreenLiveActivity.swift
//  LiveActivityLockScreen
//
//  Created by Mauricio Figueroa on 05-11-23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivityLockScreenAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LiveActivityLockScreenLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivityLockScreenAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
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
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension LiveActivityLockScreenAttributes {
    fileprivate static var preview: LiveActivityLockScreenAttributes {
        LiveActivityLockScreenAttributes(name: "World")
    }
}

extension LiveActivityLockScreenAttributes.ContentState {
    fileprivate static var smiley: LiveActivityLockScreenAttributes.ContentState {
        LiveActivityLockScreenAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LiveActivityLockScreenAttributes.ContentState {
         LiveActivityLockScreenAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LiveActivityLockScreenAttributes.preview) {
   LiveActivityLockScreenLiveActivity()
} contentStates: {
    LiveActivityLockScreenAttributes.ContentState.smiley
    LiveActivityLockScreenAttributes.ContentState.starEyes
}