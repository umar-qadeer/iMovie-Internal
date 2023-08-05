
import UIKit
import SwiftUI

class AppCoordinator: Coordinator {
    enum Destination {
        case movies
    }

    @Published var currentDestination: Destination?
    private var appDIContainer: AppDIContainer

    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }

    func navigate(to destination: Destination) {
        currentDestination = destination
    }

    func navigateBack() {
        currentDestination = nil
    }

    func makeView(for destination: Destination) -> AnyView {
        switch destination {
        case .movies:
            let diContainer = appDIContainer.makeMovieListDIContainer()
            let view = diContainer.makeMovieListSwiftUIView(self)
            return AnyView(view)
        }
    }
}



//
//class AppCoordinator: Coordinator {
//
//    enum Destination {
//        case breeds
//        case breedDetail(Breed)
//    }
//
//    // MARK: - Properties
//
//    private(set) var navigationController: UINavigationController?
//    private var appDIContainer: AppDIContainer
//
//    // MARK: - Initializer
//
//    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
//        self.navigationController = navigationController
//        self.appDIContainer = appDIContainer
//    }
//
//    // MARK: - Coordinator
//
//    @discardableResult func start(from destination: Destination = .breeds) -> UIViewController? {
//        set(to: destination)
//        return self.navigationController
//    }
//
//    @discardableResult func restart(from destination: Destination = .breeds) -> UIViewController? {
//        set(to: destination)
//        return self.navigationController
//    }
//
//    func set(to destination: Destination) {
//        let viewController = makeViewController(for: destination)
//        navigationController?.setViewControllers([viewController], animated: false)
//    }
//
//    func push(to destination: Destination) {
//        let viewController = makeViewController(for: destination)
//        navigationController?.pushViewController(viewController, animated: true)
//    }
//
//    func pop() {
//        navigationController?.popViewController(animated: true)
//    }
//
//    func present(controller viewController: UIViewController) {
//        navigationController?.present(viewController, animated: true)
//    }
//
//    func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
//        self.navigationController?.dismiss(animated: animated, completion: completion)
//    }
//
//    func makeViewController(for destination: Destination) -> UIViewController {
//        switch destination {
//        case .breeds:
//            let diContainer = appDIContainer.makeMovieListDIContainer()
//            let viewController = diContainer.makeBreedsListViewController(self)
//            return viewController
//
//        case .breedDetail(let breed):
//            let diContainer = appDIContainer.makeBreedDetailDIContainer()
//            let viewController = diContainer.makeBreedDetailViewController(self, breed: breed)
//            return viewController
//        }
//    }
//}
//
//extension AppCoordinator: BreedsListViewControllerCoordinationDelegate {
//
//    func showBreedDetail(breed: Breed) {
//        push(to: .breedDetail(breed))
//    }
//
//    func showFavourites() {
//
//    }
//}
//
//extension AppCoordinator: BreedDetailViewControllerCoordinationDelegate {
//}
