
import Foundation

protocol MoviesRepositoryProtocol: AnyObject {
    func fetchMovies(completion: @escaping (Result<MovieResponse, Error>) -> Void)
    func fetchMovieDetails(movieId: String, completion: @escaping (Result<Movie, Error>) -> Void)
}

final class MoviesRepository: MoviesRepositoryProtocol {

    // MARK: - Variables

    private let networkService: NetworkService

    // MARK: - Init

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: - BreedsRepositoryProtocol

    func fetchMovies(completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        networkService.request(MovieRequest(), completion: completion)
    }

    func fetchMovieDetails(movieId: String, completion: @escaping (Result<Movie, Error>) -> Void) {
        networkService.request(MovieDetailsRequest(movieId: movieId), completion: completion)
    }
}
