
import Foundation

final class MovieListViewModel: BaseViewModel, ObservableObject {
    
    // MARK: - Properties
    
    @Published var movies = [Movie]()
    private let breedsRepository: BreedsRepositoryProtocol?

    // MARK: - Initializers
    
    init(breedsRepository: BreedsRepositoryProtocol) {
        self.breedsRepository = breedsRepository
    }
    
    // MARK: - Functions
    
    func fetchMovies() {
        breedsRepository?.fetchMovies(completion: { [weak self] result in
            
            switch result {
            case .success(let response):
                self?.movies = response.results
            case .failure(let error):
                print(error)
            }
        })
    }
}

