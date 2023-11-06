//
//  Match.swift
//  LiveActivityExample
//
//  Created by Mauricio Figueroa on 06-11-23.
//

import Foundation

struct Match: Codable {
    let timer: ClosedRange<Date>
    let localTeamName: String
    let localTeamImage: String
    let awayTeamName: String
    let awayTeamImage: String
}
