
import Foundation

final class AppDIContainer {
    
    lazy var networkService: NetworkService = {
        return DefaultNetworkService()
    }()

    func makeMovieListDIContainer() -> MovieListDIContainer {
        let dependencies = MovieListDIContainer.Dependencies(networkService: networkService)
        return MovieListDIContainer(dependencies: dependencies)
    }

    func makeMovieDetailsDIContainer(movieId: Int) -> MovieDetailsDIContainer {
        let dependencies = MovieDetailsDIContainer.Dependencies(networkService: networkService, movieId: movieId)
        return MovieDetailsDIContainer(dependencies: dependencies)
    }
}
