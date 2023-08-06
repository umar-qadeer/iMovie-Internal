//
//  MovieDetailDIContainer.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

final class MovieDetailDIContainer {

    struct Dependencies {
        let networkService: NetworkService
        let movieId: Int
    }

    private let dependencies: Dependencies
    
    // MARK: - Initializers

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Repository

    private func makeMovieDetailRepository() -> MoviesRepositoryProtocol {
        return MoviesRepository(networkService: dependencies.networkService)
    }

    // MARK: - ViewModel

    @MainActor private func makeMovieDetailViewModel() -> MovieDetailViewModel {
        return MovieDetailViewModel(moviesRepository: makeMovieDetailRepository(), movieId: dependencies.movieId)
    }

    // MARK: - View

    @MainActor func makeMovieDetailView() -> MovieDetailView {
        let movieDetailViewModel = makeMovieDetailViewModel()
        let movieDetailView = MovieDetailView(viewModel: movieDetailViewModel)
        return movieDetailView
    }
}
