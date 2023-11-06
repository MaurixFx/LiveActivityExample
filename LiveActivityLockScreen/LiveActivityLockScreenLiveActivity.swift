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
        var scoreText: String
    }

    // Fixed non-changing properties about your activity go here!
    let match: Match
}

struct MatchScoreView: View {
    let context: ActivityViewContext<LiveActivityLockScreenAttributes>
    
    var body: some View {
        HStack {
            VStack {
                Image(context.attributes.match.localTeamImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
                Text(context.attributes.match.localTeamName)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
            }
            .frame(height: 90)
            .padding()
            
            Text(context.state.scoreText)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            VStack {
                Image(context.attributes.match.awayTeamImage)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
                Text(context.attributes.match.awayTeamName)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
            }
            .padding()
        }
    }
}

struct LiveActivityLockScreenLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivityLockScreenAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                MatchScoreView(context: context)
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

/*extension LiveActivityLockScreenAttributes {
    fileprivate static var preview: LiveActivityLockScreenAttributes {
        LiveActivityLockScreenAttributes()
    }
}

extension LiveActivityLockScreenAttributes.ContentState {
    fileprivate static var smiley: LiveActivityLockScreenAttributes.ContentState {
        LiveActivityLockScreenAttributes.ContentState(scoreText: "2-1")
     }
     
     fileprivate static var starEyes: LiveActivityLockScreenAttributes.ContentState {
         LiveActivityLockScreenAttributes.ContentState(scoreText: "3-0")
     }
}

#Preview("Notification", as: .content, using: LiveActivityLockScreenAttributes.preview) {
   LiveActivityLockScreenLiveActivity()
} contentStates: {
    LiveActivityLockScreenAttributes.ContentState.smiley
    LiveActivityLockScreenAttributes.ContentState.starEyes
}*/
