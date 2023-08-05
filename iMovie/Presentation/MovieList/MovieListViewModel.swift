
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

    func fetchMovies() async {
        do {
            let response = try await moviesRepository?.fetchMovies()
            DispatchQueue.main.async {
                self.movies = response?.results ?? []
            }
        } catch {
            print(error)
        }
    }
}

