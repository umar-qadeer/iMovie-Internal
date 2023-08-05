//
//  iMovieApp.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

@main
struct iMovieApp: App {
    @StateObject var coordinator = AppCoordinator(appDIContainer: AppDIContainer())

    var body: some Scene {
        WindowGroup {
            NavigationView {
                coordinator.makeView(for: coordinator.currentDestination ?? .movies)
            }
            .environmentObject(coordinator)
        }
    }
}
