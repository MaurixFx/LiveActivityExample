//
//  LiveActivityLockScreenBundle.swift
//  LiveActivityLockScreen
//
//  Created by Mauricio Figueroa on 05-11-23.
//

import WidgetKit
import SwiftUI

@main
struct LiveActivityLockScreenBundle: WidgetBundle {
    var body: some Widget {
        LiveActivityLockScreen()
        LiveActivityLockScreenLiveActivity()
    }
}
