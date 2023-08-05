//
//  iMovieApp.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

@main
struct iMovieApp: App {
    var appDIContainer = AppDIContainer()

    var body: some Scene {
        WindowGroup {
            let diContainer = appDIContainer.makeMovieListDIContainer()
            let view = diContainer.makeMovieListSwiftUIView()
            view
        }
    }
}
