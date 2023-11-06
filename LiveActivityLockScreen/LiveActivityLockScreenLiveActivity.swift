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
    var match: Match
}

struct MatchScoreView: View {
    let context: ActivityViewContext<LiveActivityLockScreenAttributes>
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                VStack(spacing: 10) {
                    Image(context.attributes.match.localTeamImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    Text(context.attributes.match.localTeamName)
                        .font(.caption)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text(context.state.scoreText)
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text(timerInterval: context.attributes.match.timer, countsDown: true)
                        .multilineTextAlignment(.center)
                        .frame(width: 40)
                        .font(.caption2)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    Image(context.attributes.match.awayTeamImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    Text(context.attributes.match.awayTeamName)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
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
