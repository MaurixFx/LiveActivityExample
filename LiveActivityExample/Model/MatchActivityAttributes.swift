//
//  LiveActivityAttributes.swift
//  LiveActivityExample
//
//  Created by Mauricio Figueroa on 06-11-23.
//

import Foundation
import ActivityKit

enum MatchEventType: String, Codable {
    case none
    case goal
    case redCard
}

struct MatchActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var localScoreText: String
        var awayScoreText: String
        var matchEventType: MatchEventType
        var matchEventDescription: String
    }

    // Fixed non-changing properties about your activity go here!
    var match: Match
}
