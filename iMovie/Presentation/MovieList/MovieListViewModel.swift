
import Foundation

final class MovieListViewModel: BaseViewModel, ObservableObject {
    // MARK: - Properties
    
    @Published var movies = [Movie]()
    private let moviesRepository: MoviesRepositoryProtocol?
    private var isLoading = false
    var currentPage = 1
    var totalPages = 1

    // MARK: - Initializers
    
    init(moviesRepository: MoviesRepositoryProtocol) {
        self.moviesRepository = moviesRepository
    }

    // MARK: - Functions
    
    func fetchMovies() {
        guard !isLoading, currentPage <= totalPages else {
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let response = try await moviesRepository?.fetchMovies(page: currentPage)
                isLoading = false
                currentPage += 1
                
                if let response {
                    totalPages = response.total_pages
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.movies.append(contentsOf: response.results)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}

