
import Foundation

final class MovieDetailsViewModel: BaseViewModel, ObservableObject {
    
    // MARK: - Properties
    
    @Published var movie: Movie?
    private let moviesRepository: MoviesRepositoryProtocol?
    var movieId: Int

    // MARK: - Initializers

    init(moviesRepository: MoviesRepositoryProtocol, movieId: Int) {
        self.moviesRepository = moviesRepository
        self.movieId = movieId
    }

    // MARK: - Functions

    func fetchMovieDetail() {
        Task {
            do {
                let response = try await moviesRepository?.fetchMovieDetail(movieId: movieId)
                DispatchQueue.main.async {
                    self.movie = response
                }
            } catch {
                print(error)
            }
        }
    }
}

