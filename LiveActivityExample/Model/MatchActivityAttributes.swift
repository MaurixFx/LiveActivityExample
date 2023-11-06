//
//  LiveActivityAttributes.swift
//  LiveActivityExample
//
//  Created by Mauricio Figueroa on 06-11-23.
//

import Foundation
import ActivityKit

struct MatchActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var scoreText: String
    }

    // Fixed non-changing properties about your activity go here!
    var match: Match
}
