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
    @State var isActive = false
    
    var body: some Scene {
        WindowGroup {
            
            if isActive {
                getMovieListView()
            } else {
                getSplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                            self.isActive = true
                        }
                    }
            }
        }
    }
    
    func getSplashView() -> some View {
        let diContainer = appDIContainer.makeSplashDIContainer()
        return diContainer.makeSplashView()
    }
    
    @MainActor func getMovieListView() -> some View {
        let diContainer = appDIContainer.makeMovieListDIContainer()
        return diContainer.makeMovieListView()
    }
}
