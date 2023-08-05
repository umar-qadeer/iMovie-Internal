
import Foundation

final class MovieListViewModel: BaseViewModel, ObservableObject {
    // MARK: - Properties
    
    @Published var movies = [Movie]()
    private let breedsRepository: BreedsRepositoryProtocol?
    var currentPage = 1
    var totalPages = 1
    private var isLoading = false

    // MARK: - Initializers
    
    init(breedsRepository: BreedsRepositoryProtocol) {
        self.breedsRepository = breedsRepository
    }
    
    // MARK: - Functions
    
    func fetchMovies() {
        guard !isLoading, currentPage <= totalPages else {
            return
        }
        
        isLoading = true
        breedsRepository?.fetchMovies(page: currentPage) { [weak self] result in
            self?.isLoading = false
            
            switch result {
            case .success(let response):
                self?.movies.append(contentsOf: response.results)
                self?.currentPage += 1
                self?.totalPages = response.total_pages
            case .failure(let error):
                print(error)
            }
        }
    }
}

