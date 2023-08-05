
import Foundation

final class MovieDetailsViewModel: BaseViewModel, ObservableObject {
    
    // MARK: - Properties
    
    @Published var movie : Movie?
    var movieId: String
    private let moviesRepository: MoviesRepositoryProtocol?

    // MARK: - Initializers

    init(moviesRepository: MoviesRepositoryProtocol, movieId: String) {
        self.moviesRepository = moviesRepository
        self.movieId = movieId
    }

    // MARK: - Functions

    func fetchMovieDetails() {
        moviesRepository?.fetchMovieDetails(movieId: movieId, completion: { [weak self] result in
            switch result {
            case .success(let response):
                self?.movie = response
            case .failure(let error):
                print(error)
            }
        })
    }
}

