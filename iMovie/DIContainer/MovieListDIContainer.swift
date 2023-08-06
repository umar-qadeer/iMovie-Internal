
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

    private func makeMovieListRepository() -> MoviesRepositoryProtocol {
        return MoviesRepository(networkService: dependencies.networkService)
    }

    // MARK: - ViewModel

    @MainActor private func makeMovieListViewModel() -> MovieListViewModel {
        return MovieListViewModel(moviesRepository: makeMovieListRepository())
    }

    // MARK: - ViewController

    @MainActor func makeMovieListSwiftUIView() -> MovieListView {
        let viewModel = makeMovieListViewModel()
        let view = MovieListView(viewModel: viewModel)
        return view
    }
}
