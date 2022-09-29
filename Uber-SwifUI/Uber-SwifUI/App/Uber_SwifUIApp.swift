//
//  Uber_SwifUIApp.swift
//  Uber-SwifUI
//
//  Created by Safar Safarov on 26/09/22.
//

import SwiftUI

@main
struct Uber_SwifUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
