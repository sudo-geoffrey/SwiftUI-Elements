//
//  SwiftUI_ElementsApp.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 2/18/25.
//

import SwiftUI

// TODO: Only show intro on first launch

@main
struct SwiftUI_ElementsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(showIntro: true)
        }
    }
}
