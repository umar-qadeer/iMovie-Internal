
import Foundation

protocol BreedsRepositoryProtocol: AnyObject {
    func fetchBreeds(completion: @escaping (Result<[Breed], Error>) -> Void)
    func fetchBreedImages(by name: String, completion: @escaping (Result<[BreedDetail], Error>) -> Void)
}

final class BreedsRepository: BreedsRepositoryProtocol {
    
    // MARK: - Variables
    
    private let networkService: NetworkService
    
    // MARK: - Init
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - BreedsRepositoryProtocol
    
    func fetchBreeds(completion: @escaping (Result<[Breed], Error>) -> Void) {
        networkService.request(BreedsRequest(), completion: completion)
    }
    
    func fetchBreedImages(by name: String, completion: @escaping (Result<[BreedDetail], Error>) -> Void) {
        networkService.request(BreedImagesRequest(name: name), completion: completion)
    }
}
