
import Foundation

final class AppDIContainer {
    
    lazy var networkService: NetworkService = {
        return DefaultNetworkService()
    }()

    func makeMovieListDIContainer() -> MovieListDIContainer {
        let dependencies = MovieListDIContainer.Dependencies(networkService: networkService)
        return MovieListDIContainer(dependencies: dependencies)
    }
}
