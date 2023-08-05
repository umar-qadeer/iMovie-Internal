
import Foundation

final class MovieListDIContainer {

    struct Dependencies {
        let networkService: NetworkService
    }

    private let dependencies: Dependencies
    
    // MARK: - Initializers

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Repository

    private func makeBreedsRepository() -> BreedsRepositoryProtocol {
        return MoviesRepository(networkService: dependencies.networkService)
    }

    // MARK: - ViewModel

    private func makeMovieListViewModel() -> MovieListViewModel {
        return MovieListViewModel(breedsRepository: makeBreedsRepository())
    }

    // MARK: - ViewController

    func makeMovieListSwiftUIView(_ coordinator: AppCoordinator) -> MovieListView {
        let viewModel = makeMovieListViewModel()
        let view = MovieListView(viewModel: viewModel)
        return view
    }
}
