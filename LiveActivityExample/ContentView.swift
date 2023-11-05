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
        let attributes = LiveActivityLockScreenAttributes(name: "OneSignal Dev App Live Activity")
        let contentState = LiveActivityLockScreenAttributes.ContentState(message: "Live Activities")
        
        let activityContent = ActivityContent(state: contentState, staleDate: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!)

        do {

            let activity = try
            Activity<LiveActivityLockScreenAttributes>.request(
                    attributes: attributes,
                    content: activityContent,
                    pushType: .token)

            Task {

                for await data in activity.pushTokenUpdates {
                    let myToken = data.map {String(format: "%02x", $0)}.joined()
                    OneSignal.LiveActivities.enter("my_activity_id", withToken: myToken)
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
