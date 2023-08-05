
import Foundation

final class MovieDetailsDIContainer {

    struct Dependencies {
        let networkService: NetworkService
        let movieId: String
    }

    private let dependencies: Dependencies
    
    // MARK: - Initializers

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Repository

    private func makeBreedsRepository() -> MoviesRepositoryProtocol {
        return MoviesRepository(networkService: dependencies.networkService)
    }

    // MARK: - ViewModel

    private func makeMovieDetailsViewModel() -> MovieDetailsViewModel {
        return MovieDetailsViewModel(moviesRepository: makeBreedsRepository(), movieId: dependencies.movieId)
    }

    // MARK: - View

    func makeMovieDetailsSwiftUIView() -> MovieDetailView {
        let viewModel = makeMovieDetailsViewModel()
        let view = MovieDetailView(viewModel: viewModel)
        return view
    }
}
