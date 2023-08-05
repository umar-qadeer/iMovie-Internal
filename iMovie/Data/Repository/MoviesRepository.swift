
import Foundation

protocol MoviesRepositoryProtocol: AnyObject {
    func fetchMovies() async throws -> MovieResponse
    func fetchMovieDetails(movieId: String) async throws -> Movie
}

final class MoviesRepository: MoviesRepositoryProtocol {

    // MARK: - Variables

    private let networkService: NetworkService

    // MARK: - Init

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: - BreedsRepositoryProtocol

    func fetchMovies() async throws -> MovieResponse {
        return try await networkService.request(MovieRequest())
    }

    func fetchMovieDetails(movieId: String) async throws -> Movie {
        return try await networkService.request(MovieDetailsRequest(movieId: movieId))
    }
}
