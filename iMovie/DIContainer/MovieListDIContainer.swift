//
//  MovieListDIContainer.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

final class MovieListDIContainer {

    struct Dependencies {
        let networkService: NetworkService
    }

    private let dependencies: Dependencies
    
    // MARK: - Initializers

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Repository

    private func makeMovieListRepository() -> MoviesRepositoryProtocol {
        return MoviesRepository(networkService: dependencies.networkService)
    }

    // MARK: - ViewModel

    @MainActor private func makeMovieListViewModel() -> MovieListViewModel {
        return MovieListViewModel(moviesRepository: makeMovieListRepository())
    }

    // MARK: - View

    @MainActor func makeMovieListView() -> MovieListView {
        let movieListViewModel = makeMovieListViewModel()
        let movieListView = MovieListView(viewModel: movieListViewModel)
        return movieListView
    }
}
