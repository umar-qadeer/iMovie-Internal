
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

    func fetchMovieDetails() async {
        do {
            let response = try await moviesRepository?.fetchMovieDetails(movieId: movieId)
            DispatchQueue.main.async {
                self.movie = response
            }
        } catch {
            print(error)
        }
    }
}

