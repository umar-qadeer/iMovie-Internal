
import Foundation

final class MovieListViewModel: BaseViewModel, ObservableObject {
    
    // MARK: - Properties
    
    @Published var movies = [Movie]()
    private let moviesRepository: MoviesRepositoryProtocol?

    // MARK: - Initializers
    
    init(moviesRepository: MoviesRepositoryProtocol) {
        self.moviesRepository = moviesRepository
    }
    
    // MARK: - Functions

    func fetchMovies() {
        moviesRepository?.fetchMovies(completion: { [weak self] result in
            
            switch result {
            case .success(let response):
                self?.movies = response.results
            case .failure(let error):
                print(error)
            }
        })
    }
}

