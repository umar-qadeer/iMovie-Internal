//
//  AppDIContainer.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

final class AppDIContainer {
    
    lazy var networkService: NetworkService = {
        return DefaultNetworkService()
    }()
    
    func makeSplashDIContainer() -> SplashDIContainer {
        SplashDIContainer()
    }

    func makeMovieListDIContainer() -> MovieListDIContainer {
        let dependencies = MovieListDIContainer.Dependencies(networkService: networkService)
        return MovieListDIContainer(dependencies: dependencies)
    }

    func makeMovieDetailDIContainer(movieId: Int) -> MovieDetailDIContainer {
        let dependencies = MovieDetailDIContainer.Dependencies(networkService: networkService, movieId: movieId)
        return MovieDetailDIContainer(dependencies: dependencies)
    }
}
