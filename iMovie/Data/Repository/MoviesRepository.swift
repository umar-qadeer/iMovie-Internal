//
//  MoviesRepository.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

protocol MoviesRepositoryProtocol: AnyObject {
    func fetchMovies(page: Int) async throws -> MovieResponse
    func fetchMovieDetail(movieId: Int) async throws -> Movie
}

final class MoviesRepository: MoviesRepositoryProtocol {

    // MARK: - Variables

    private let networkService: NetworkService

    // MARK: - Init

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: - MoviesRepositoryProtocol

    func fetchMovies(page: Int) async throws -> MovieResponse {
        return try await networkService.request(MovieRequest(page: page))
    }

    func fetchMovieDetail(movieId: Int) async throws -> Movie {
        return try await networkService.request(MovieDetailRequest(movieId: movieId))
    }
}
