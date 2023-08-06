//
//  MovieDetailViewModel.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

@MainActor final class MovieDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var movie: Movie?
    @Published var isErrorPresented = false
    @Published var isLoading = false
    private let moviesRepository: MoviesRepositoryProtocol?
    var movieId: Int
    var error: Error?

    // MARK: - Initializers

    init(moviesRepository: MoviesRepositoryProtocol, movieId: Int) {
        self.moviesRepository = moviesRepository
        self.movieId = movieId
    }

    // MARK: - Functions

    func fetchMovieDetail() {
        isLoading = true
        Task {
            do {
                let response = try await moviesRepository?.fetchMovieDetail(movieId: movieId)
                self.movie = response
            } catch {
                self.error = error
                self.isErrorPresented = true
            }
            
            self.isLoading = false
        }
    }
}

