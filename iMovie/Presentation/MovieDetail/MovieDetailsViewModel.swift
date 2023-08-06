
import Foundation

final class MovieDetailsViewModel: BaseViewModel, ObservableObject {
    
    // MARK: - Properties
    
    @Published var movie: Movie?
    @Published var isErrorPresented = false
    private let moviesRepository: MoviesRepositoryProtocol?
    var movieId: Int
    var error: Error?

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
                self.error = error
                self.isErrorPresented = true
            }
        }
    }
}

