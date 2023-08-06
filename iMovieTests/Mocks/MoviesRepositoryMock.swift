
import Foundation
@testable import iMovie

class MoviesRepositoryMock: MoviesRepositoryProtocol {
    
    private let mockDataGenerator = MockDataGenerator()
    
    func fetchMovies(page: Int) async throws -> iMovie.MovieResponse {
        return try mockDataGenerator.getMockMovies()
    }
    
    func fetchMovieDetail(movieId: Int) async throws -> iMovie.Movie {
        return try mockDataGenerator.getMockMovie(id: movieId)
    }
}
