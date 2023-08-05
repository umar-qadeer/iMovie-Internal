
import Foundation

final class AppDIContainer {
    
    lazy var networkService: NetworkService = {
        return DefaultNetworkService()
    }()
    
    func makeBreedsListDIContainer() -> BreedsListDIContainer {
        let dependencies = BreedsListDIContainer.Dependencies(networkService: networkService)
        return BreedsListDIContainer(dependencies: dependencies)
    }
    
    func makeBreedDetailDIContainer() -> BreedDetailDIContainer {
        let dependencies = BreedDetailDIContainer.Dependencies(networkService: networkService)
        return BreedDetailDIContainer(dependencies: dependencies)
    }
}
