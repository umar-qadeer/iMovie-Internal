
import Foundation

@MainActor final class MovieDetailsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var movie: Movie?
    @Published var isErrorPresented = false
    @Published var isLoading = false
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
        isLoading = true
        Task {
            do {
                let response = try await moviesRepository?.fetchMovieDetail(movieId: movieId)
                self.isLoading = false
                self.movie = response
            } catch {
                self.error = error
                self.isErrorPresented = true
            }
        }
    }
}

