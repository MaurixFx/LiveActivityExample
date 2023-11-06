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
        guard let localImageData = UIImage(named: "colocolo")?.jpegData(compressionQuality: 0.5) else {
            return
        }
        
        guard let awayImageData = UIImage(named: "uchile")?.jpegData(compressionQuality: 0.5) else {
            return
        }

        let match = Match(
            localTeamName: "Colo-Colo",
            localTeamImage: "colocolo",
            awayTeamName: "Boca Juniors",
            awayTeamImage: "boca")
        
        
        let attributes = LiveActivityLockScreenAttributes(match: match)
        let contentState = LiveActivityLockScreenAttributes.ContentState(scoreText: "2-0")
        
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
