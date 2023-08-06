//
//  MoviesRepositoryMock.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation
@testable import iMovie

final class MoviesRepositoryMock: MoviesRepositoryProtocol {
    
    private let mockDataGenerator = MockDataGenerator()
    
    func fetchMovies(page: Int) async throws -> MovieResponse {
        return try mockDataGenerator.getMockMovies()
    }
    
    func fetchMovieDetail(movieId: Int) async throws -> Movie {
        return try mockDataGenerator.getMockMovie(id: movieId)
    }
}
