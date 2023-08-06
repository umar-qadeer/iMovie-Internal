
import Foundation
@testable import iMovie

class MoviesRepositoryMock: MoviesRepositoryProtocol {
    private let mockDataGenerator = MockDataGenerator()
    func fetchMovies(page: Int) async throws -> iMovie.MovieResponse {
        return try mockDataGenerator.getMockMovies()
    }
    
    func fetchMovieDetails(movieId: String) async throws -> iMovie.Movie {
        return try mockDataGenerator.getMockMovie(id: movieId)
    }
}
