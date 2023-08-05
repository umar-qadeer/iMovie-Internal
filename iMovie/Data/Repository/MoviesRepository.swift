
import Foundation

protocol MoviesRepositoryProtocol: AnyObject {
    func fetchMovies(page: Int) async throws -> MovieResponse
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

    func fetchMovies(page: Int) async throws -> MovieResponse {
        return try await networkService.request(MovieRequest(page: page))
    }

    func fetchMovieDetails(movieId: String) async throws -> Movie {
        return try await networkService.request(MovieDetailsRequest(movieId: movieId))
    }
}
