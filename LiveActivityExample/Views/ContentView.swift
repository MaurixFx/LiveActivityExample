//
//  ContentView.swift
//  LiveActivityExample
//
//  Created by Mauricio Figueroa on 05-11-23.
//

import SwiftUI
import ActivityKit
import OneSignalFramework

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                startLiveActivity()
            } label: {
                Text("Start a Live Activity")
            }
        }
        .padding()
    }
    
    private func startLiveActivity() {
        let future = Calendar.current.date(byAdding: .minute, value: 15, to: Date()) ?? Date()
        
        let match = Match(timer: Date.now...future,
                          localTeamName: "Colo Colo",
                          localTeamImage: "colocolo",
                          awayTeamName: "Boca Juniors",
                          awayTeamImage: "boca")
        let attributes = MatchActivityAttributes(match: match)
        let contentState = MatchActivityAttributes.ContentState(localScoreText: "0", awayScoreText: "0", matchEventType: .none, matchEventDescription: "")
        
        let activityContent = ActivityContent(state: contentState, staleDate: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!)

        do {

            let activity = try
            Activity<MatchActivityAttributes>.request(
                    attributes: attributes,
                    content: activityContent,
                    pushType: .token)

            Task {

                for await data in activity.pushTokenUpdates {
                    let myToken = data.map {String(format: "%02x", $0)}.joined()
                    OneSignal.LiveActivities.enter("live_activity_id", withToken: myToken)
                }
            }

        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
