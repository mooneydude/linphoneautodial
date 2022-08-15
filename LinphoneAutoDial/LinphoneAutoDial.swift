//
//  CreateWithSwiftApp.swift
//  CreateWithSwift
//
//  Created by Paul Mooney on 8/11/22.
//

// Links:
// https://www.createwithswift.com/creating-a-custom-app-launch-experience-in-swiftui-with-deep-linking/
// https://cocoacasts.com/working-with-nsurlcomponents-in-swift

// ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist

import SwiftUI

@main
struct LinphoneAutoDial: App {

    @State var deeplinkTarget: DeeplinkManager.DeeplinkTarget?
        
    var body: some Scene {
        WindowGroup {
            Group {
                switch self.deeplinkTarget {
                case .home(let queryInfo):
                    HomeView(
                        title: "globe",
                        urlHost: queryInfo,
                        content: { }
                    )
                 case .details(let queryInfo):
                    DetailView(
                        title: "number.circle",
                        urlHost: queryInfo,
                        content: { }
                    )
                case .none:
                    HomeView(
                        title: "house",
                        urlHost: "",
                        content: { }
                    )
                }
            }
        }
    }
}


