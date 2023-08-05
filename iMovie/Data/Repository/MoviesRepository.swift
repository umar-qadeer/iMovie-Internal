
import Foundation

protocol BreedsRepositoryProtocol: AnyObject {
    func fetchMovies(completion: @escaping (Result<MovieResponse, Error>) -> Void)
}

final class MoviesRepository: BreedsRepositoryProtocol {
    
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
}
