//
//  MatchScoreView.swift
//  LiveActivityExample
//
//  Created by Mauricio Figueroa on 06-11-23.
//

import Foundation
import SwiftUI

struct MatchScoreView: View {
    let match: Match
    let localScoreText: String
    let awayScoreText: String
    let matchEventType: MatchEventType
    let matchEventDescription: String

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                VStack(spacing: 10) {
                    Image(match.localTeamImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    Text(match.localTeamName)
                        .font(.caption)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    HStack {
                        Text(localScoreText)
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Text("-")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(awayScoreText)
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    Text(timerInterval: match.timer, countsDown: false)
                        .multilineTextAlignment(.center)
                        .frame(width: 40)
                        .font(.caption2)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    Image(match.awayTeamImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    Text(match.awayTeamName)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }

            if matchEventType != .none {
                Spacer()

                VStack {
                    HStack {
                        Image(matchEventImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)

                        Text(matchEventDescription)
                            .font(.caption)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
        .padding()
    }

    private var matchEventImageName: String {
        switch matchEventType {
        case .none:
            return ""
        case .goal:
            return "goal"
        case .redCard:
            return "redCard"
        }
    }
}
